package com.springapp.mvc.controller;

import com.springapp.mvc.domain.Question;
import com.springapp.mvc.services.AnswersService;
import com.springapp.mvc.services.QuestionsService;
import com.springapp.mvc.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TestController {

    @Autowired
    private QuestionsService questionsService;

    @Autowired
    private AnswersService answersService;

    @Autowired
    private TestService testService;

    @RequestMapping(value = "/test/{testid}", method = RequestMethod.GET)
    public ModelAndView testController(HttpServletRequest request, @PathVariable("testid") Integer testid) throws Exception {
        ModelAndView mav = new ModelAndView("test");
        mav.addObject("testid", testid);
        request.getSession().setAttribute("testID", testid);
        String username = (String) request.getSession().getAttribute("username");
        Integer questionID = questionsService.takeQuestionById(testid, username);
        request.getSession().setAttribute("questionID", questionID);
        addQuestionAndAnswers(mav, questionID);
        return mav;
    }

    private void addQuestionAndAnswers(ModelAndView mav, Integer questionID) {
        Question question = questionsService.takeQuestion(questionID);
        mav.addObject("question", question);
        mav.addObject("answ", answersService.takeAnswers(questionID));
    }

    @RequestMapping(value = "/question", method = RequestMethod.POST)
    public ModelAndView question(HttpServletRequest request,
                                 @RequestParam(required = false) Integer res) throws Exception {
        ModelAndView mav = new ModelAndView("question");
        int userID = (Integer) request.getSession().getAttribute("userID");
        int testID = (Integer) request.getSession().getAttribute("testID");
        int questionID = (Integer) request.getSession().getAttribute("questionID");
        String username = (String) request.getSession().getAttribute("username");
        testService.saveCurrTest(userID, testID, questionID, res);
        questionID = questionsService.takeQuestionById(testID, username);
        addQuestionAndAnswers(mav, questionID);
        request.getSession().setAttribute("questionID", questionID);
        return mav;
    }

    @RequestMapping(value = "/showtest", method = RequestMethod.GET)
    public String showTest(HttpServletRequest request, ModelMap model) {
        model.addAttribute("tests", testService.takeTests());
        return "showTest";

    }
}

