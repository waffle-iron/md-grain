package com.makingdevs

class QuestionaryUserController {

  def springSecurityService
  def questionaryPerInstanceLinkService
  
  def firstEvaluate(){
    def questionaryAcontestar = Questionary.findByCodeNameIlike("%${params.courseKey}-initial%")
    def usuarioActual = springSecurityService.currentUser
    if(usuarioActual){
      if(questionaryAcontestar){
        def nombre="${params.courseKey}-initial"
        def questionaryPerInstanceLink=questionaryPerInstanceLinkService.findQuestionaryPerInstanceByCodeName(usuarioActual.id,nombre)
        if(questionaryPerInstanceLink){
          if(questionaryPerInstanceLink.questionaryPerInstance.questionaryPerInstanceStatus==QuestionaryPerInstanceStatus.SIN_CONTESTAR){
            redirect(action: "answerQuestionary", controller:"questionary", 
                params: [id:questionaryPerInstanceLink.questionaryPerInstance.id,
                idQL:questionaryPerInstanceLink.id,
                url:params.url])
          }else{
            def numPreguntas=questionaryPerInstanceLink.questionaryPerInstance.questionary.questions.size()
            redirect(controller:"evaluate", action:"evaluateQuestionary", params:[questionaryPerInstanceLink:questionaryPerInstanceLink.id,questionaryPerInstance:questionaryPerInstanceLink.questionaryPerInstance.id,
              url:params.url,numPreguntas:numPreguntas])
          }
        }else{
          def questionaryPerInstanceLinkNew = questionaryPerInstanceLinkService.createQuestionaryPerInstance(usuarioActual,questionaryAcontestar.id)
            redirect(action: "answerQuestionary", controller:"questionary", 
                params: [id:questionaryPerInstanceLinkNew.questionaryPerInstance.id,
                idQL:questionaryPerInstanceLinkNew.id,
                url:params.url])
        }
      }else{
        redirect(uri: params.url-"md-grain/")
      }
    }else{
      redirect(controller:"login")
    }
  }
  
}