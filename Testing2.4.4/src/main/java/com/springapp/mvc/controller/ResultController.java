package com.springapp.mvc.controller;

import com.springapp.mvc.services.AnswersService;
import com.springapp.mvc.services.QuestionsService;
import com.springapp.mvc.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ResultController {

    @Autowired
    private QuestionsService questionsService;

    @Autowired
    private AnswersService answersService;

    @Autowired
    private TestService testService;

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public ModelAndView Result(HttpServletRequest request,
                               @RequestParam(required = true) Integer res) throws Exception {
        ModelAndView mav = new ModelAndView("currentResult");
        int userID = (Integer) request.getSession().getAttribute("userID");
        int testID = (Integer) request.getSession().getAttribute("testID");
        int questionID = (Integer) request.getSession().getAttribute("questionID");
        testService.saveCurrTest(userID, testID, questionID, res);
        questionsService.clearMap((String) request.getSession().getAttribute("username"));
        mav.addObject("questions", questionsService.showQuestion(userID, testID));
        mav.addObject("currAnswers", answersService.takeCurrAnswer(userID, testID));
        mav.addObject("correctAnswers", answersService.takeCorrectAnswer(userID, testID));
        Integer result = answersService.result(userID, testID);
        mav.addObject("result", result);
        testService.saveResultTest(userID, testID, result);
        testService.clearCurrTest(userID, testID);
        return mav;
    }

    @RequestMapping("/userResults")
    public ModelAndView UserResults(HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("userResult");
        int userID = (Integer) request.getSession().getAttribute("userID");
        mav.addObject("username", request.getSession().getAttribute("username"));
        mav.addObject("test", testService.takeTestId(userID));
        mav.addObject("currAnswers", testService.takeResultTest(userID));
        mav.addObject("time", testService.takeTestTime(userID));
        return mav;
    }

}
