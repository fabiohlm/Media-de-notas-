      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MODULO2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 WS-VARIAVEIS.
           03 WS-NOME           PIC X(20) VALUE SPACES.
           03 WS-MATERIA        PIC X(20) VALUE SPACES.
           03 WS-N1             PIC 99V9  VALUE ZEROS.
           03 WS-N2             PIC 99V9  VALUE ZEROS.
           03 WS-N3             PIC 99V9  VALUE ZEROS.
           03 WS-N4             PIC 99V9  VALUE ZEROS.
           03 WS-MEDIA          PIC 99V9  VALUE ZEROS.
           03 WS-FUNC           PIC X(3)  VALUE SPACES.
               88 ERRO              VALUE 'ERR'.
               88 NOVAMENTE         VALUE 'SIM'.
           03 WS-TIPO           PIC X(3)  VALUE SPACES.
               88 NNUM              VALUE 'ERR'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY '********** SISTEMA DE MEDIA DE NOTAS **********'.

       P001-INICIO.
            INITIALISE WS-VARIAVEIS.

            PERFORM P002-VAR.

            PERFORM P010-RESULT.

            PERFORM P001-FIM.

       P002-VAR.
            DISPLAY 'DIGITE O NOME DO ALUNO: '
            ACCEPT WS-NOME.
            DISPLAY 'DIGITE A MATERIA: '
            ACCEPT WS-MATERIA.
            DISPLAY 'DIGITE A PRIMEIRA NOTA(1 A 10): '
            ACCEPT WS-N1.
            DISPLAY 'DIGITE A SEGUNDA NOTA(1 A 10): '
            ACCEPT WS-N2.
            DISPLAY 'DIGITE A TERCEIRA NOTA(1 A 10): '
            ACCEPT WS-N3.
            DISPLAY 'DIGITE A QUARTA NOTA(1 A 10): '.
            ACCEPT WS-N4.
            DISPLAY WS-N1.
            DISPLAY WS-N2.
            DISPLAY WS-N3.
            DISPLAY WS-N4.

            IF WS-N1 < 1 THEN PERFORM P999-ERRO.
            IF WS-N2 < 1 THEN PERFORM P999-ERRO.
            IF WS-N3 < 1 THEN PERFORM P999-ERRO.
            IF WS-N4 < 1 THEN PERFORM P999-ERRO.



       P010-RESULT.

            CALL "C:\Users\Fabinho\Desktop\COBOL\bin\MODULO2MOD"
                                               USING WS-VARIAVEIS.

            EVALUATE TRUE
               WHEN ERRO        PERFORM P999-ERRO
               WHEN NNUM        PERFORM P999-ERRO
               WHEN NOVAMENTE   PERFORM P001-INICIO
               WHEN OTHER       PERFORM P001-FIM
            END-EVALUATE.

       P999-ERRO.
            DISPLAY '***********************************************'
            DISPLAY '*      NOTAS INVALIDAS | TENTE NOVAMENTE      *'
            DISPLAY '***********************************************'.
            PERFORM P001-INICIO.
       P001-FIM.
            DISPLAY 'PROGRAMA ENCERRADO'
            STOP RUN.
       END PROGRAM MODULO2.
