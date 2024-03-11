(define (problem huddersfield)
(:domain urbantraffic)
(:objects
wrac1 wrbc1 wrcc1 wrdc1 wrec1 wrfc1 - junction
hsac3_c_wrac1 wrac1_z_hsac1 wrac1_y_wrbc1 wrac1_m_stand firth_d_wrac1 wrac1_n_firth stand_f_wrac1 wrac1_x_wrbc1 wrbc1_a_wrac1 wrbc1_b_wrcc1 wrbc1_r_silve silve_w_wrbc1 wrbc1_s_somer somer_v_wrbc1 wrbc1_b_wrac1 wrcc1_z_wrbc1 wrcc1_x_wrdc1 smith_c_wrcc1 wrcc1_w_wrdc1 wrdc1_a_wrcc1 wrdc1_b_wrec1 wrdc1_q_abnor wrdc1_l_absou abnor_v_wrdc1 wrec1_z_wrdc1 wrec1_y_wrfc1 oldwa_c_wrec1 wrec1_y_wrdc1 oldwa_d_wrec1 wakef_z_wrfc1 wrfc1_a_wrec1 wrfc1_r_broad broad_x_wrfc1 wrfc1_t_wakef outside - link
wrac1_stage1 wrac1_stage2 wrac1_stage3 wrac1_stage4 wrbc1_stage1 wrbc1_stage2 wrbc1_stage3 wrbc1_stage4 wrbc1_stage5 wrcc1_stage1 wrcc1_stage2 wrcc1_stage3 wrcc1_stage4 wrcc1_stage5 wrcc1_stage6 wrdc1_stage1 wrdc1_stage2 wrdc1_stage3 wrdc1_stage4 wrec1_stage1 wrec1_stage2 wrec1_stage3 wrec1_stage4 wrfc1_stage1 wrfc1_stage2 wrfc1_stage3 wrfc1_stage4 wrfc1_stage5 fake - stage
)
(:init

(= (granularity) 1.0)

(active fake)
(active wrac1_stage2)
(active wrbc1_stage2)
(active wrcc1_stage1)
(inter wrdc1_stage4)
(active wrec1_stage1)
(active wrfc1_stage1)

(= (greentime wrac1) 25)
(= (intertime wrac1) 0)
(= (greentime wrbc1) 8)
(= (intertime wrbc1) 0)
(= (greentime wrcc1) 1)
(= (intertime wrcc1) 0)
(= (greentime wrdc1) 0)
(= (intertime wrdc1) 13)
(= (greentime wrec1) 18)
(= (intertime wrec1) 0)
(= (greentime wrfc1) 25)
(= (intertime wrfc1) 0)

(= (interlimit wrac1_stage1) 8)
(= (interlimit wrac1_stage2) 8)
(= (interlimit wrac1_stage3) 8)
(= (interlimit wrac1_stage4) 8)
(= (interlimit wrbc1_stage1) 8)
(= (interlimit wrbc1_stage2) 8)
(= (interlimit wrbc1_stage3) 8)
(= (interlimit wrbc1_stage4) 8)
(= (interlimit wrbc1_stage5) 8)
(= (interlimit wrcc1_stage1) 8)
(= (interlimit wrcc1_stage2) 8)
(= (interlimit wrcc1_stage3) 8)
(= (interlimit wrcc1_stage4) 8)
(= (interlimit wrcc1_stage5) 8)
(= (interlimit wrcc1_stage6) 8)
(= (interlimit wrdc1_stage1) 8)
(= (interlimit wrdc1_stage2) 8)
(= (interlimit wrdc1_stage3) 8)
(= (interlimit wrdc1_stage4) 8)
(= (interlimit wrec1_stage1) 8)
(= (interlimit wrec1_stage2) 8)
(= (interlimit wrec1_stage3) 8)
(= (interlimit wrec1_stage4) 8)
(= (interlimit wrfc1_stage1) 8)
(= (interlimit wrfc1_stage2) 8)
(= (interlimit wrfc1_stage3) 8)
(= (interlimit wrfc1_stage4) 8)
(= (interlimit wrfc1_stage5) 8)

(= (defaultgreentime wrac1_stage1) 14)
(= (defaultgreentime wrac1_stage2) 46)
(= (defaultgreentime wrac1_stage3) 14)
(= (defaultgreentime wrac1_stage4) 14)

(= (defaultgreentime wrbc1_stage1) 10)
(= (defaultgreentime wrbc1_stage2) 10)
(= (defaultgreentime wrbc1_stage3) 40)
(= (defaultgreentime wrbc1_stage4) 10)
(= (defaultgreentime wrbc1_stage5) 10)

(= (defaultgreentime wrcc1_stage1) 10)
(= (defaultgreentime wrcc1_stage2) 10)
(= (defaultgreentime wrcc1_stage3) 22)
(= (defaultgreentime wrcc1_stage4) 10)
(= (defaultgreentime wrcc1_stage5) 10)
(= (defaultgreentime wrcc1_stage6) 10)

(= (defaultgreentime wrdc1_stage1) 14)
(= (defaultgreentime wrdc1_stage2) 14)
(= (defaultgreentime wrdc1_stage3) 46)
(= (defaultgreentime wrdc1_stage4) 14)

(= (defaultgreentime wrec1_stage1) 40)
(= (defaultgreentime wrec1_stage2) 16)
(= (defaultgreentime wrec1_stage3) 16)
(= (defaultgreentime wrec1_stage4) 16)

(= (defaultgreentime wrfc1_stage1) 40)
(= (defaultgreentime wrfc1_stage2) 10)
(= (defaultgreentime wrfc1_stage3) 10)
(= (defaultgreentime wrfc1_stage4) 10)
(= (defaultgreentime wrfc1_stage5) 10)

(= (occupancy hsac3_c_wrac1) 26.38)
(= (occupancy wrac1_y_wrbc1) 19.2)
(= (occupancy stand_f_wrac1) 11.17)
(= (occupancy firth_d_wrac1) 5.02)
(= (occupancy wrac1_x_wrbc1) 10.5)
(= (occupancy wrbc1_a_wrac1) 32.83)
(= (occupancy wrbc1_b_wrcc1) 13.12)
(= (occupancy silve_w_wrbc1) 1.44)
(= (occupancy somer_v_wrbc1) 9.49)
(= (occupancy wrbc1_b_wrac1) 0.87)
(= (occupancy wrcc1_z_wrbc1) 17.1)
(= (occupancy wrcc1_x_wrdc1) 47.17)
(= (occupancy smith_c_wrcc1) 1.16)
(= (occupancy wrcc1_w_wrdc1) 1.59)
(= (occupancy wrdc1_a_wrcc1) 23.03)
(= (occupancy wrdc1_b_wrec1) 7.24)
(= (occupancy abnor_v_wrdc1) 13.81)
(= (occupancy wrec1_z_wrdc1) 13.25)
(= (occupancy wrec1_y_wrfc1) 3.61)
(= (occupancy oldwa_c_wrec1) 0.17)
(= (occupancy wrec1_y_wrdc1) 1.88)
(= (occupancy oldwa_d_wrec1) 0.35)
(= (occupancy wakef_z_wrfc1) 5.25)
(= (occupancy wrfc1_a_wrec1) 2.67)
(= (occupancy broad_x_wrfc1) 7.88)
(= (occupancy wrac1_z_hsac1) 0.0)
(= (occupancy wrac1_m_stand) 0.0)
(= (occupancy wrac1_n_firth) 0.0)
(= (occupancy wrbc1_r_silve) 0.0)
(= (occupancy wrbc1_s_somer) 0.0)
(= (occupancy wrdc1_q_abnor) 0.0)
(= (occupancy wrdc1_l_absou) 0.0)
(= (occupancy wrfc1_r_broad) 0.0)
(= (occupancy wrfc1_t_wakef) 0.0)
(= (occupancy outside) 50000.0)

(controllable wrac1)
(controllable wrbc1)
(controllable wrcc1)
(controllable wrdc1)
(controllable wrec1)
(controllable wrfc1)

(next wrac1_stage1 wrac1_stage2)
(next wrac1_stage2 wrac1_stage3)
(next wrac1_stage3 wrac1_stage4)
(next wrac1_stage4 wrac1_stage1)
(next wrbc1_stage1 wrbc1_stage2)
(next wrbc1_stage2 wrbc1_stage3)
(next wrbc1_stage3 wrbc1_stage4)
(next wrbc1_stage4 wrbc1_stage5)
(next wrbc1_stage5 wrbc1_stage1)
(next wrcc1_stage1 wrcc1_stage2)
(next wrcc1_stage2 wrcc1_stage3)
(next wrcc1_stage3 wrcc1_stage4)
(next wrcc1_stage4 wrcc1_stage5)
(next wrcc1_stage5 wrcc1_stage6)
(next wrcc1_stage6 wrcc1_stage1)
(next wrdc1_stage1 wrdc1_stage2)
(next wrdc1_stage2 wrdc1_stage3)
(next wrdc1_stage3 wrdc1_stage4)
(next wrdc1_stage4 wrdc1_stage1)
(next wrec1_stage1 wrec1_stage2)
(next wrec1_stage2 wrec1_stage3)
(next wrec1_stage3 wrec1_stage4)
(next wrec1_stage4 wrec1_stage1)
(next wrfc1_stage1 wrfc1_stage2)
(next wrfc1_stage2 wrfc1_stage3)
(next wrfc1_stage3 wrfc1_stage4)
(next wrfc1_stage4 wrfc1_stage5)
(next wrfc1_stage5 wrfc1_stage1)

(contains wrac1 wrac1_stage1)
(contains wrac1 wrac1_stage2)
(contains wrac1 wrac1_stage3)
(contains wrac1 wrac1_stage4)
(contains wrbc1 wrbc1_stage1)
(contains wrbc1 wrbc1_stage2)
(contains wrbc1 wrbc1_stage3)
(contains wrbc1 wrbc1_stage4)
(contains wrbc1 wrbc1_stage5)
(contains wrcc1 wrcc1_stage1)
(contains wrcc1 wrcc1_stage2)
(contains wrcc1 wrcc1_stage3)
(contains wrcc1 wrcc1_stage4)
(contains wrcc1 wrcc1_stage5)
(contains wrcc1 wrcc1_stage6)
(contains wrdc1 wrdc1_stage1)
(contains wrdc1 wrdc1_stage2)
(contains wrdc1 wrdc1_stage3)
(contains wrdc1 wrdc1_stage4)
(contains wrec1 wrec1_stage1)
(contains wrec1 wrec1_stage2)
(contains wrec1 wrec1_stage3)
(contains wrec1 wrec1_stage4)
(contains wrfc1 wrfc1_stage1)
(contains wrfc1 wrfc1_stage2)
(contains wrfc1 wrfc1_stage3)
(contains wrfc1 wrfc1_stage4)
(contains wrfc1 wrfc1_stage5)

(= (capacity outside) 100000.0)
(= (capacity hsac3_c_wrac1)   55.0)
(= (capacity wrac1_z_hsac1)   100000.0)
(= (capacity wrac1_y_wrbc1)   55.5)
(= (capacity wrac1_m_stand)   100000.0)
(= (capacity stand_f_wrac1)   54.0)
(= (capacity wrac1_n_firth)   100000.0)
(= (capacity firth_d_wrac1)   27.67)
(= (capacity wrac1_x_wrbc1)   24.5)
(= (capacity wrbc1_a_wrac1)   85.0)
(= (capacity wrbc1_b_wrcc1)   30.66)
(= (capacity wrbc1_r_silve)  100000.0)
(= (capacity silve_w_wrbc1)  13.67)
(= (capacity wrbc1_s_somer)  100000.0)
(= (capacity somer_v_wrbc1)  55.5)
(= (capacity wrbc1_b_wrac1)  12.0)
(= (capacity wrcc1_z_wrbc1)  56.0)
(= (capacity wrcc1_x_wrdc1)  93.3)
(= (capacity smith_c_wrcc1)  14.13)
(= (capacity wrdc1_a_wrcc1)  42.0)
(= (capacity wrdc1_b_wrec1)  26.67)
(= (capacity wrdc1_q_abnor)  100000.0)
(= (capacity wrcc1_w_wrdc1)   5.0)
(= (capacity wrdc1_l_absou)   100000.0)
(= (capacity abnor_v_wrdc1)   148.33)
(= (capacity wrec1_z_wrdc1)   28.67)
(= (capacity wrec1_y_wrfc1)   13.0)
(= (capacity oldwa_c_wrec1)   12.33)
(= (capacity wrec1_y_wrdc1)   6.33)
(= (capacity oldwa_d_wrec1)   13.33)
(= (capacity wakef_z_wrfc1)   24.0)
(= (capacity wrfc1_a_wrec1)   9.66)
(= (capacity wrfc1_r_broad)   100000.0)
(= (capacity broad_x_wrfc1)   13.67)
(= (capacity wrfc1_t_wakef)   100000.0)

(= (turnrate wrac1_stage1 hsac3_c_wrac1 wrac1_x_wrbc1) 0.129)
(= (turnrate wrac1_stage1 hsac3_c_wrac1 wrac1_m_stand) 0.3915)
(= (turnrate wrac1_stage1 hsac3_c_wrac1 wrac1_y_wrbc1) 0.656)
(= (turnrate wrac1_stage1 wrbc1_a_wrac1 wrac1_z_hsac1) 0.494)
(= (turnrate wrac1_stage1 wrbc1_a_wrac1 wrac1_n_firth) 0.447)
(= (turnrate wrac1_stage2 wrbc1_a_wrac1 wrac1_z_hsac1) 0.494)
(= (turnrate wrac1_stage2 wrbc1_a_wrac1 wrac1_n_firth) 0.447)
(= (turnrate wrac1_stage2 wrbc1_b_wrac1 wrac1_m_stand) 0.412)
(= (turnrate wrbc1_stage1 wrac1_y_wrbc1 wrbc1_b_wrcc1) 0.576)
(= (turnrate wrbc1_stage1 wrac1_y_wrbc1 wrbc1_r_silve) 0.13)
(= (turnrate wrbc1_stage1 wrcc1_z_wrbc1 wrbc1_a_wrac1) 1.05)
(= (turnrate wrbc1_stage1 wrcc1_z_wrbc1 wrbc1_b_wrac1) 0.1265)
(= (turnrate wrbc1_stage2 silve_w_wrbc1 wrbc1_a_wrac1) 0.3502)
(= (turnrate wrbc1_stage2 silve_w_wrbc1 wrbc1_b_wrac1) 0.061)
(= (turnrate wrbc1_stage3 wrac1_y_wrbc1 wrbc1_b_wrcc1) 0.576)
(= (turnrate wrbc1_stage3 wrac1_y_wrbc1 wrbc1_r_silve) 0.13)
(= (turnrate wrbc1_stage3 wrac1_x_wrbc1 wrbc1_s_somer) 0.412)
(= (turnrate wrbc1_stage3 somer_v_wrbc1 wrbc1_a_wrac1) 0.51)
(= (turnrate wrbc1_stage3 somer_v_wrbc1 wrbc1_b_wrac1) 0.0194)
(= (turnrate wrbc1_stage4 wrac1_x_wrbc1 wrbc1_s_somer) 0.412)
(= (turnrate wrbc1_stage4 somer_v_wrbc1 wrbc1_a_wrac1) 0.51)
(= (turnrate wrbc1_stage4 somer_v_wrbc1 wrbc1_b_wrac1) 0.0194)
(= (turnrate wrbc1_stage5 wrac1_y_wrbc1 wrbc1_b_wrcc1) 0.576)
(= (turnrate wrbc1_stage5 wrac1_y_wrbc1 wrbc1_r_silve) 0.13)
(= (turnrate wrbc1_stage5 wrac1_x_wrbc1 wrbc1_s_somer) 0.412)
(= (turnrate wrcc1_stage1 wrbc1_b_wrcc1 wrcc1_x_wrdc1) 0.447)
(= (turnrate wrcc1_stage1 wrbc1_b_wrcc1 wrcc1_w_wrdc1) 0.024)
(= (turnrate wrcc1_stage1 wrdc1_a_wrcc1 wrcc1_z_wrbc1) 0.82353)
(= (turnrate wrcc1_stage2 wrdc1_a_wrcc1 wrcc1_z_wrbc1) 0.82353)
(= (turnrate wrcc1_stage3 wrbc1_b_wrcc1 wrcc1_x_wrdc1) 0.447)
(= (turnrate wrcc1_stage3 wrbc1_b_wrcc1 wrcc1_w_wrdc1) 0.024)
(= (turnrate wrcc1_stage4 smith_c_wrcc1 wrcc1_z_wrbc1) 0.143)
(= (turnrate wrcc1_stage4 smith_c_wrcc1 wrcc1_x_wrdc1) 0.2636)
(= (turnrate wrcc1_stage4 smith_c_wrcc1 wrcc1_w_wrdc1) 0.064)
(= (turnrate wrcc1_stage5 smith_c_wrcc1 wrcc1_z_wrbc1) 0.143)
(= (turnrate wrcc1_stage5 smith_c_wrcc1 wrcc1_x_wrdc1) 0.2636)
(= (turnrate wrcc1_stage5 smith_c_wrcc1 wrcc1_w_wrdc1) 0.064)
(= (turnrate wrdc1_stage1 wrcc1_x_wrdc1 wrdc1_b_wrec1) 0.659)
(= (turnrate wrdc1_stage1 wrcc1_x_wrdc1 wrdc1_l_absou) 0.165)
(= (turnrate wrdc1_stage1 wrec1_z_wrdc1 wrdc1_a_wrcc1) 0.8)
(= (turnrate wrdc1_stage1 wrec1_z_wrdc1 wrdc1_q_abnor) 0.2)
(= (turnrate wrdc1_stage2 wrec1_z_wrdc1 wrdc1_a_wrcc1) 0.8)
(= (turnrate wrdc1_stage2 wrec1_z_wrdc1 wrdc1_q_abnor) 0.2)
(= (turnrate wrdc1_stage2 wrec1_y_wrdc1 wrdc1_l_absou) 0.353)
(= (turnrate wrdc1_stage3 abnor_v_wrdc1 wrdc1_a_wrcc1) 0.05)
(= (turnrate wrdc1_stage3 abnor_v_wrdc1 wrdc1_b_wrec1) 0.029)
(= (turnrate wrdc1_stage3 abnor_v_wrdc1 wrdc1_l_absou) 0.45)
(= (turnrate wrdc1_stage4 wrcc1_x_wrdc1 wrdc1_b_wrec1) 0.659)
(= (turnrate wrdc1_stage4 wrcc1_x_wrdc1 wrdc1_l_absou) 0.165)
(= (turnrate wrdc1_stage4 wrcc1_w_wrdc1 wrdc1_q_abnor) 0.353)
(= (turnrate wrec1_stage1 wrfc1_a_wrec1 wrec1_z_wrdc1) 0.808)
(= (turnrate wrec1_stage1 wrfc1_a_wrec1 wrec1_y_wrdc1) 0.016)
(= (turnrate wrec1_stage1 wrdc1_b_wrec1 wrec1_y_wrfc1) 0.824)
(= (turnrate wrec1_stage2 wrdc1_b_wrec1 wrec1_y_wrfc1) 0.824)
(= (turnrate wrec1_stage3 oldwa_c_wrec1 wrec1_z_wrdc1) 0.346)
(= (turnrate wrec1_stage3 oldwa_c_wrec1 wrec1_y_wrdc1) 0.007)
(= (turnrate wrec1_stage3 oldwa_d_wrec1 wrec1_y_wrfc1) 0.353)
(= (turnrate wrec1_stage4 wrfc1_a_wrec1 wrec1_z_wrdc1) 0.808)
(= (turnrate wrec1_stage4 wrfc1_a_wrec1 wrec1_y_wrdc1) 0.016)
(= (turnrate wrec1_stage4 oldwa_d_wrec1 wrec1_y_wrfc1) 0.353)
(= (turnrate wrfc1_stage1 wakef_z_wrfc1 wrfc1_a_wrec1) 0.765)
(= (turnrate wrfc1_stage1 wrec1_y_wrfc1 wrfc1_r_broad) 0.082)
(= (turnrate wrfc1_stage1 wrec1_y_wrfc1 wrfc1_t_wakef) 0.741)
(= (turnrate wrfc1_stage2 wakef_z_wrfc1 wrfc1_a_wrec1) 0.765)
(= (turnrate wrfc1_stage2 wrec1_y_wrfc1 wrfc1_r_broad) 0.082)
(= (turnrate wrfc1_stage2 wrec1_y_wrfc1 wrfc1_t_wakef) 0.741)
(= (turnrate wrfc1_stage3 broad_x_wrfc1 wrfc1_a_wrec1) 0.571)
(= (turnrate wrfc1_stage3 broad_x_wrfc1 wrfc1_t_wakef) 0.017)
(= (turnrate wrac1_stage3 firth_d_wrac1 wrac1_z_hsac1) 0.04)
(= (turnrate wrac1_stage3 firth_d_wrac1 wrac1_y_wrbc1) 0.25)
(= (turnrate wrac1_stage3 firth_d_wrac1 wrac1_x_wrbc1) 0.06)
(= (turnrate wrac1_stage3 firth_d_wrac1 wrac1_m_stand) 0.06) 
(= (turnrate wrac1_stage4 firth_d_wrac1 wrac1_z_hsac1) 0.04)
(= (turnrate wrac1_stage4 firth_d_wrac1 wrac1_y_wrbc1) 0.25)
(= (turnrate wrac1_stage4 firth_d_wrac1 wrac1_x_wrbc1) 0.06)
(= (turnrate wrac1_stage4 firth_d_wrac1 wrac1_m_stand) 0.06) 
(= (turnrate wrac1_stage2 stand_f_wrac1 wrac1_n_firth)  0.2) 
(= (turnrate wrac1_stage2 stand_f_wrac1 wrac1_y_wrbc1) 0.2882)
(= (turnrate wrac1_stage2 stand_f_wrac1 wrac1_x_wrbc1) 0.1)
(= (turnrate wrac1_stage3 stand_f_wrac1 wrac1_n_firth)  0.2) 
(= (turnrate wrac1_stage3 stand_f_wrac1 wrac1_y_wrbc1) 0.2882)
(= (turnrate wrac1_stage3 stand_f_wrac1 wrac1_x_wrbc1) 0.1)
(= (turnrate fake outside hsac3_c_wrac1) 0.3379)
(= (turnrate fake outside stand_f_wrac1) 0.2246)
(= (turnrate fake outside firth_d_wrac1) 0.0604)
(= (turnrate fake outside silve_w_wrbc1) 0.0411)
(= (turnrate fake outside somer_v_wrbc1) 0.0955)
(= (turnrate fake outside smith_c_wrcc1) 0.0645)
(= (turnrate fake outside abnor_v_wrdc1) 0.0718)
(= (turnrate fake outside oldwa_c_wrec1) 0.0064)
(= (turnrate fake outside oldwa_d_wrec1) 0.0128)
(= (turnrate fake outside wakef_z_wrfc1) 0.2702)
(= (turnrate fake outside broad_x_wrfc1) 0.1255)

(= (mingreentime wrac1_stage1 ) 10 )
(= (maxgreentime wrac1_stage1 ) 120 )

(= (mingreentime wrac1_stage2 ) 9 )
(= (maxgreentime wrac1_stage2 ) 120 )

(= (mingreentime wrac1_stage3 ) 8 )
(= (maxgreentime wrac1_stage3 ) 120 )

(= (mingreentime wrac1_stage4 ) 3 )
(= (maxgreentime wrac1_stage4 ) 120 )

(= (mingreentime wrbc1_stage1 ) 7 )
(= (maxgreentime wrbc1_stage1 ) 120 )

(= (mingreentime wrbc1_stage2 ) 5 )
(= (maxgreentime wrbc1_stage2 ) 120 )

(= (mingreentime wrbc1_stage3 ) 9 )
(= (maxgreentime wrbc1_stage3 ) 120 )

(= (mingreentime wrbc1_stage4 ) 5 )
(= (maxgreentime wrbc1_stage4 ) 120 )

(= (mingreentime wrbc1_stage5 ) 2 )
(= (maxgreentime wrbc1_stage5 ) 120 )

(= (mingreentime wrcc1_stage1 ) 7 )
(= (maxgreentime wrcc1_stage1 ) 120 )

(= (mingreentime wrcc1_stage2 ) 5 )
(= (maxgreentime wrcc1_stage2 ) 120 )

(= (mingreentime wrcc1_stage3 ) 5 )
(= (maxgreentime wrcc1_stage3 ) 120 )

(= (mingreentime wrcc1_stage4 ) 4 )
(= (maxgreentime wrcc1_stage4 ) 120 )

(= (mingreentime wrcc1_stage5 ) 7 )
(= (maxgreentime wrcc1_stage5 ) 120 )

(= (mingreentime wrcc1_stage6 ) 2 )
(= (maxgreentime wrcc1_stage6 ) 120 )

(= (mingreentime wrdc1_stage1 ) 7 )
(= (maxgreentime wrdc1_stage1 ) 120 )

(= (mingreentime wrdc1_stage2 ) 7 )
(= (maxgreentime wrdc1_stage2 ) 120 )

(= (mingreentime wrdc1_stage3 ) 7 )
(= (maxgreentime wrdc1_stage3 ) 120 )

(= (mingreentime wrdc1_stage4 ) 7 )
(= (maxgreentime wrdc1_stage4 ) 120 )

(= (mingreentime wrec1_stage1 ) 10 )
(= (maxgreentime wrec1_stage1 ) 120 )

(= (mingreentime wrec1_stage2 ) 2 )
(= (maxgreentime wrec1_stage2 ) 120 )

(= (mingreentime wrec1_stage3 ) 6 )
(= (maxgreentime wrec1_stage3 ) 120 )

(= (mingreentime wrec1_stage4 ) 6 )
(= (maxgreentime wrec1_stage4 ) 120 )

(= (mingreentime wrfc1_stage1 ) 10 )
(= (maxgreentime wrfc1_stage1 ) 120 )

(= (mingreentime wrfc1_stage2 ) 4 )
(= (maxgreentime wrfc1_stage2 ) 120 )

(= (mingreentime wrfc1_stage3 ) 7 )
(= (maxgreentime wrfc1_stage3 ) 120 )

(= (mingreentime wrfc1_stage4 ) 7 )
(= (maxgreentime wrfc1_stage4 ) 120 )

(= (mingreentime wrfc1_stage5 ) 2 )
(= (maxgreentime wrfc1_stage5 ) 120 )

(= (counter abnor_v_wrdc1)  0.0)
(= (counter broad_x_wrfc1)   0.0)
(= (counter firth_d_wrac1)   0.0)
(= (counter hsac3_c_wrac1)   0.0)
(= (counter oldwa_c_wrec1)   0.0)
(= (counter oldwa_d_wrec1)   0.0)
(= (counter silve_w_wrbc1)  0.0)
(= (counter smith_c_wrcc1)  0.0)
(= (counter somer_v_wrbc1)  0.0)
(= (counter stand_f_wrac1)   0.0)
(= (counter wakef_z_wrfc1)   0.0)
(= (counter wrac1_m_stand)   0.0)
(= (counter wrac1_n_firth)  0.0)
(= (counter wrac1_x_wrbc1)   0.0)
(= (counter wrac1_y_wrbc1)   0.0)
(= (counter wrac1_z_hsac1)   0.0)
(= (counter wrbc1_a_wrac1)   0.0)
(= (counter wrbc1_b_wrac1)  0.0)
(= (counter wrbc1_b_wrcc1)   0.0)
(= (counter wrbc1_r_silve)  0.0)
(= (counter wrbc1_s_somer)  0.0)
(= (counter wrcc1_w_wrdc1)  0.0)
(= (counter wrcc1_x_wrdc1)  0.0)
(= (counter wrcc1_z_wrbc1)  0.0)
(= (counter wrdc1_a_wrcc1)  0.0)
(= (counter wrdc1_b_wrec1)  0.0)
(= (counter wrdc1_l_absou)  0.0)
(= (counter wrdc1_q_abnor)  0.0)
(= (counter wrec1_y_wrdc1)   0.0)
(= (counter wrec1_y_wrfc1)   0.0)
(= (counter wrec1_z_wrdc1)  0.0)
(= (counter wrfc1_a_wrec1)   0.0)
(= (counter wrfc1_r_broad)   0.0)
(= (counter wrfc1_t_wakef)   0.0)

(= (cycletime wrac1) 88)
(= (cycletime wrbc1) 102)
(= (cycletime wrcc1) 109)
(= (cycletime wrdc1) 88)
(= (cycletime wrec1) 102)
(= (cycletime wrfc1) 102)
(= (maxcycletime wrac1) 200)
(= (maxcycletime wrbc1) 200)
(= (maxcycletime wrcc1) 200)
(= (maxcycletime wrdc1) 200)
(= (maxcycletime wrec1) 200)
(= (maxcycletime wrfc1) 200)
(= (mincycletime wrac1) 50)
(= (mincycletime wrbc1) 50)
(= (mincycletime wrcc1) 50)
(= (mincycletime wrdc1) 50)
(= (mincycletime wrec1) 50)
(= (mincycletime wrfc1) 50)
(= (time) 0)

)

(:goal 
  (and 
     (>= (counter wrac1_y_wrbc1) 350)
  )
 )
)


