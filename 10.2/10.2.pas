PROGRAM Correction(INPUT, OUTPUT);
VAR
  Ch1, State, Mark: CHAR;
BEGIN {Correction}
  WHILE Ch1 <> 'N' 
  DO
    BEGIN
      READ(Ch1);   
      WRITE(Ch1)
    END;
  WRITELN;
  WRITE('  '); 
  WHILE State <> '.'
  DO
    BEGIN
      IF Ch1 = ' '
      THEN
        WHILE Ch1 = ' '
        DO
          READ(Ch1)
      ELSE
        READ(Ch1);
      IF Ch1 = 'E'
      THEN
        BEGIN
          READ(Ch1);
          IF Ch1 = 'N'
          THEN
            BEGIN
              IF Mark <> ';' 
              THEN
                WRITELN;
              WRITELN('END.');
              State := '.'
            END
          ELSE
            BEGIN
              WRITE('E');
              WRITE(Ch1)
            END
        END
      ELSE
        BEGIN
          IF Ch1 = ';'
          THEN
            BEGIN
              WRITELN(Ch1);
              Mark := ';';
              READ(Ch1);
              IF Ch1 = ' '
              THEN
                WHILE Ch1 = ' '
                DO
                  READ(Ch1);
              WHILE Ch1 = ';' 
              DO
                BEGIN
                  WRITE('  ');
                  WRITELN(Ch1);
                  READ(Ch1);
                  IF Ch1 = ' '
                  THEN
                    WHILE Ch1 = ' '
                    DO
                      READ(Ch1)
                END;
              IF Ch1 = 'E'
              THEN
                BEGIN
                  READ(Ch1);
                  IF Ch1 = 'N'
                  THEN
                    BEGIN
                      IF Mark <> ';' 
                      THEN
                        WRITELN;
                      WRITELN('END.');
                      State := '.'
                    END
                  ELSE
                    BEGIN
                      WRITE('E');
                      WRITE(Ch1)
                    END
                END
              ELSE
                BEGIN
                  WRITE('  ');
                  WRITE(Ch1)
                END           
            END
          ELSE
            BEGIN
              IF Ch1 ='('
              THEN
                BEGIN
                  WRITE(Ch1);
                  WHILE Ch1 <> ')'
                  DO
                    BEGIN
                      READ(Ch1);
                      IF Ch1 = ' '
                      THEN
                        WHILE Ch1 = ' '
                        DO
                          BEGIN
                            READ(Ch1);
                            IF (Ch1 <> ' ') AND (Ch1 <> ')')
                            THEN
                              BEGIN
                                WRITE(Ch1);
                                IF Ch1 = ','
                                THEN
                                  WRITE(' ')
                              END
                          END
                      ELSE
                        BEGIN
                          IF Ch1 <> ')'
                          THEN
                            BEGIN
                              WRITE(Ch1);
                              IF Ch1 = ','
                              THEN
                                WRITE(' ')
                            END
                        END
                    END    
                END;                
              IF Ch1 <> ' '
              THEN
                WRITE(Ch1);
              Mark :=' '
            END                   
        END
    END    
END. {Correction}           
