{
  "Comment": "Step Function para verificar operação e processar com resiliência",
  "StartAt": "VerificaTipoOperacao",
  "States": {
    "VerificaTipoOperacao": {
      "Type": "Choice",
      "Choices": [
        {
          "Variable": "$.tipoOperacao",
          "StringEquals": "criar",
          "Next": "ChamaLambdaExterna"
        },
        {
          "Variable": "$.tipoOperacao",
          "StringEquals": "atualizar",
          "Next": "ChamaLambdaExterna"
        },
        {
          "Variable": "$.tipoOperacao",
          "StringEquals": "deletar",
          "Next": "AtualizaBancoDeDados"
        }
      ],
      "Default": "OperacaoInvalida"
    },
    "ChamaLambdaExterna": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:REGION:ACCOUNT_ID:function:ConsomeApiExternaLambda",
      "Retry": [
        {
          "ErrorEquals": ["Lambda.ServiceException", "Lambda.AWSLambdaException", "Lambda.SdkClientException"],
          "IntervalSeconds": 2,
          "MaxAttempts": 3,
          "BackoffRate": 2
        }
      ],
      "Catch": [
        {
          "ErrorEquals": ["States.ALL"],
          "Next": "FalhaNaExecucao"
        }
      ],
      "Next": "AtualizaBancoDeDados"
    },
    "AtualizaBancoDeDados": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:REGION:ACCOUNT_ID:function:AtualizaBancoDeDadosLambda",
      "Retry": [
        {
          "ErrorEquals": ["Lambda.ServiceException", "Lambda.AWSLambdaException", "Lambda.SdkClientException"],
          "IntervalSeconds": 2,
          "MaxAttempts": 3,
          "BackoffRate": 2
        }
      ],
      "Catch": [
        {
          "ErrorEquals": ["States.ALL"],
          "Next": "FalhaNaExecucao"
        }
      ],
      "End": true
    },
    "FalhaNaExecucao": {
      "Type": "Fail",
      "Error": "ExecucaoFalhou",
      "Cause": "Erro durante a execução da Step Function"
    },
    "OperacaoInvalida": {
      "Type": "Fail",
      "Error": "OperacaoInvalida",
      "Cause": "O tipo de operação fornecido é inválido"
    }
  }
}
