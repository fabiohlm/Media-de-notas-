      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MODULO2MOD.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01 WS-PAR.
           03 WS-NOME           PIC X(20) VALUE SPACES.
           03 WS-MATERIA        PIC X(20) VALUE SPACES.
           03 WS-N1             PIC 99V9  VALUE ZEROS.
           03 WS-N2             PIC 99V9  VALUE ZEROS.
           03 WS-N3             PIC 99V9  VALUE ZEROS.
           03 WS-N4             PIC 99V9  VALUE ZEROS.
           03 WS-MEDIA          PIC 99V9  VALUE ZEROS.
           03 WS-PARFUNC        PIC X(4) VALUE SPACES.
               88 ERRO          VALUE 'ERRO'.
               88 NOVAMENTE     VALUE 'SIM'.
           03 WS-TIPO           PIC X(3)  VALUE SPACES.
               88 NNUM              VALUE 'ERR'.

       PROCEDURE DIVISION USING WS-PAR.
       MAIN-PROCEDURE.
       P001-INICIO.

            IF NNUM THEN
                PERFORM P001-FIM.

            COMPUTE WS-MEDIA = ((WS-N1 + WS-N2 + WS-N3 + WS-N4)/4)
                           ON SIZE ERROR MOVE 'ERR' TO WS-PARFUNC
                                                 PERFORM P001-FIM
            END-COMPUTE.

            DISPLAY '*** RESULTADO DO PROCESSAMENTO ***'
            DISPLAY '                                  '
            DISPLAY 'Nome do Aluno     : ' WS-NOME
            DISPLAY 'Materia           : ' WS-MATERIA
            DISPLAY 'Media             : ' WS-MEDIA.
            IF WS-MEDIA NOT LESS 7 THEN
                DISPLAY 'Status            : APROVADO'
            ELSE
                DISPLAY 'Status            : REPROVADO'
            END-IF.
            DISPLAY '                               '
            DISPLAY '*******************************************'
            DISPLAY '                               '
            DISPLAY 'DESEJA FAZER O PROCESSO NOVAMENTE?: '
            ACCEPT WS-PARFUNC.

            EVALUATE TRUE
               WHEN ERRO        MOVE 'ERR' TO WS-PARFUNC
               WHEN NOVAMENTE   MOVE 'SIM' TO WS-PARFUNC
               WHEN OTHER       PERFORM P001-FIM
            END-EVALUATE.

       P001-FIM.
            GOBACK.
       END PROGRAM MODULO2MOD.
