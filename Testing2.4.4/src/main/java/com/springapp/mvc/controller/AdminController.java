package com.springapp.mvc.controller;

import com.springapp.mvc.domain.User;
import com.springapp.mvc.services.AnswersService;
import com.springapp.mvc.services.QuestionsService;
import com.springapp.mvc.services.TestService;
import com.springapp.mvc.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private TestService testService;

    @Autowired
    private QuestionsService questionsService;

    @Autowired
    private AnswersService answersService;

    @RequestMapping("/edit")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView edit() throws Exception {
        ModelAndView mav = new ModelAndView("edit");
        mav.addObject("tests", testService.takeTests());
        return mav;
    }

    @RequestMapping(value = "/addQuestion/{testid}", method = RequestMethod.GET)
    public ModelAndView addQuestion(HttpServletRequest request,
                                    @PathVariable("testid") Integer testid) throws Exception {
        ModelAndView mav = new ModelAndView("addQuestion");
        request.getSession().setAttribute("quetestid", testid);
        return mav;
    }

    @RequestMapping("/saveQuestion")
    public ModelAndView saveQuestion(HttpServletRequest request,
                                     @RequestParam(required = true) String question,
                                     @RequestParam(required = true) String answer1,
                                     @RequestParam(required = true) String answer2,
                                     @RequestParam(required = true) String answer3,
                                     @RequestParam(required = true) String answer4) throws Exception {
        ModelAndView mav = new ModelAndView("saveQuestion");
        Integer testId = (Integer) request.getSession().getAttribute("quetestid");
        questionsService.saveQuestion(question, testId);
        Integer questionId = questionsService.takeQuestionId(question);
        request.getSession().setAttribute("questionId", questionId);
        answersService.saveAnswers(questionId, answer1, answer2, answer3, answer4);
        mav.addObject("answers", answersService.takeAnswers(questionId));
        return mav;
    }

    @RequestMapping(value = "/saveCorrect/{correct}", method = RequestMethod.GET)
    public ModelAndView saveCorrectAnswer(@PathVariable("correct") Integer correct) throws Exception {
        ModelAndView mav = new ModelAndView("addQuestion");
        answersService.saveCorrect(correct);
        return mav;
    }

    @RequestMapping("/saveTest")
    public ModelAndView saveTest(HttpServletRequest request,
                                 @RequestParam(required = true) String test) throws Exception {
        ModelAndView mav = new ModelAndView("edit");
        testService.saveTest(test);
        return mav;
    }

    @RequestMapping(value = "/deleteTest/{testid}", method = RequestMethod.GET)
    public ModelAndView deleteTest(HttpServletRequest request,
                                   @PathVariable("testid") Integer testId) throws Exception {
        ModelAndView mav = new ModelAndView("edit");
        testService.deleteTest(testId);
        mav.addObject("tests", testService.takeTests());
        return mav;
    }

    @RequestMapping(value = "/cancel", method = RequestMethod.GET)
    public String cancelQuestion(HttpServletRequest request) throws Exception {
        Integer questionId = (Integer) request.getSession().getAttribute("questionId");
        testService.deleteQuestion(questionId);
        return "/edit";
    }


    @RequestMapping(value = "/editUsers")
    public ModelAndView editUsers() {
        ModelAndView mav = new ModelAndView("editUsers");
        ArrayList<User> users = userService.takeUsersList();
        mav.addObject("users", users);
        return mav;
    }

    @RequestMapping(value = "/downloadVideo", method = RequestMethod.POST)
    @ResponseBody
    public String downloadVideo(@RequestParam("name") String name,
                                @RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(name + "-uploaded")));
                stream.write(bytes);
                stream.close();
                return "Вы удачно загрузили " + name + " в " + name + "-uploaded !";
            } catch (Exception e) {
                return "Вам не удалось загрузить " + name + " => " + e.getMessage();
            }
        } else {
            return "Вам не удалось загрузить " + name + " потому что файл пустой.";
        }

    }

}
