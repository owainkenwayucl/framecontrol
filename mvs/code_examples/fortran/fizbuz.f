1     FORMAT('       FIZZ')
2     FORMAT('       BUZZ')
3     FORMAT('   FIZZBUZZ')
4     FORMAT(I11)
      DO100I=1,20
      J=0
      IF(MOD(I,3).EQ.0)J=J+1
      IF(MOD(I,5).EQ.0)J=J+2
      GOTO(10,20,30),J
      WRITE(6,4)I
      GOTO100
10    WRITE(6,1)
      GOTO100
20    WRITE(6,2)
      GOTO100
30    WRITE(6,3)
100   CONTINUE
      STOP
      END
