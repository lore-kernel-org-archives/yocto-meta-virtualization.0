Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F924E92722
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 23:37:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16366.1766878630292986754
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 Dec 2025 15:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GC4sQ7xG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=KpzOdx38;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRMwH7k1257245
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 Dec 2025 23:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=H0DdCeuvA3x7jhnb74L0/UJiHa4f4nizC2U3Xw0D05U=; b=GC
	4sQ7xG3krASXPyAqQFu9YWzMMD6Fs7XWa9QkOnMFuqpCf6Q6ZprRa5IeJqH0Qvao
	VDJvSMqIM8cvqvY1lj7/gv+R6eddCv4XSpSiMzFGe/IWiR8Rul8WT/EPpjYiOBAJ
	dlCBSgj3PRkg1bxrArePqlxHOMVHdd9CSg/65IQairIrQ4KlbHNORKV8ZF8EZTld
	7dDj3hW16PPLPNY8/RA5bFDMlJX86swFmKzNGx4spdWZxy+1F1YGIp52cWzKtaqh
	ZZCZo3Pr8s6XDkPwJUiW8vySeSGAGH7XD1uAI74Vrs2y1EdqyYOyVFM6ugbn3zBP
	533jEY4p3eCERZUrNggA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bs7nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 Dec 2025 23:37:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee04f4c632so157468551cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 Dec 2025 15:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766878628; x=1767483428; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0DdCeuvA3x7jhnb74L0/UJiHa4f4nizC2U3Xw0D05U=;
        b=KpzOdx38aZnxILLmgRTR1KkGNxhTmZKhToFUAOXuxqH+74AWWsddJ2lv2DSKOsuK2Z
         5tDa8hcCbKSMcpxAye5ar2yuZwS70gj6l9Xr5mfdLLdIttwsKpiO8PNweno3kUiLDSG+
         cqhavYxiFuw7gAypJbSk+pIlQ8DQpjBBEH6jBu4/p/DoNGPYqKImuZB+iQRFXr9tKeTl
         NT2qNCnXq1Cfcit70mKhrHHyKqQvfclL70v1qpritqTd9lAF4SgjcWCOnuv06QGilqjx
         MkKz4fnmkXtDYexLbgKgr0IXDoUIDjVGj5Dkghh1TQY/kkN7cq8xrouki8noL5RWAxT3
         RkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766878628; x=1767483428;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0DdCeuvA3x7jhnb74L0/UJiHa4f4nizC2U3Xw0D05U=;
        b=VD4Fe54wj3a0OVQWwxORah/2lDfCL0j5lNQgywOMfR+cXoeyuWDeulgSM3UMsEOjJr
         HNn4CQJmOGmrvPLEDk6WmdY25ykoQcwE/QNhWAUL7fUQO1vAFFkugkTN4xT7JRFZEjb+
         yHlnWawJrf0ac1zsfaGd4oB6CyBFCJd3/auUTyUM+yGoUGIAUcuTBm/EanGI6v3cod8X
         GrA5OqI8CabJzLaRkn8nFbJPuKyBaHNczF9aUHF/nDLPxppjcUs7LET3ox5JY3K+QTix
         Zu0rdXzuQu+hcsZLm8a0m9buTqAFdN+qgy38Zj9fYimcZgnBApHoFqkynhknV937a6L2
         /2DA==
X-Gm-Message-State: AOJu0Yy6o43DI4CftxL4MF+dHApSkdoyoy0XFySWhnL9iW+9bpK/Ekpd
	Vu6KrP0MGYtII+s1i1ch4OLDP5hsXHX9D6tksmMkG1j/l+wfvelykU5TliWhIlOj2gEP080nsL7
	2O/F+q4/DQVSlMY6gefSMhs2GODv2QL2va85LRwQyxQAZYg+ji0A02f/8oKbQEylWudlO50K51g
	A/hFpUZ8FbbyS+9D9GzA==
X-Gm-Gg: AY/fxX5QDIpw2wqGKNNnMvHx/ruQlCvOHdwFpBIy0RnvYHgzo+pV532uDl/Nn3mfzWk
	km/RBCzeubfucocuCHdh7IIU3OBbsrTEwiPx6p+oM26V/KUjA/6cqFMrlab9R1RnXyw+4y9oLPB
	7MnyQCDHnOqaTvfvIZ/glwvDv1Z47A8/GmDgU1jpHRIAAxED/UegxUQkr2E9fTfuZxPxo8cG8Vr
	kD1jEpA0DFsdy6V3N9chlHQztR6RQs6MZn5Vl0EZe4oIZIBRXPsETFL/xB+x8CeDqzZQXm7nVED
	X9Cml2M7Qt5gAy+zG08q9ViceH0v/fNSEPGQs9g7ang7LubJdL3sXvfawrtFowKAHWajG9Wh7gX
	1Y6/LgtuptL6mU17LbP8SE+8SifYwZGL6nhauueKtFMs21x2ORBqeuZTjydI/Oyuubc0em9xH3T
	3Gm24g49wxMpYsSuFJPkIt/J0=
X-Received: by 2002:a05:622a:544d:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4f4abccfc04mr334634371cf.10.1766878628449;
        Sat, 27 Dec 2025 15:37:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw989WWTWAvamRDfm632QJiOCvzHJSxnGbj7Zi+VthCehX5/0zD5IcTIBT+/uD4cb3XZKUiA==
X-Received: by 2002:a05:622a:544d:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4f4abccfc04mr334634201cf.10.1766878627823;
        Sat, 27 Dec 2025 15:37:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de719sm70247961fa.8.2025.12.27.15.37.05
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 15:37:07 -0800 (PST)
Date: Sun, 28 Dec 2025 01:37:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: nerdctl fails in rm_work
Message-ID: <3pakbkmf474bma2anwabz4e6t674vsqr6lpksnqy3ix6d33i7e@4lrzjpkmt6kw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: ypm6VdaXaltFbbOLOgM2SoeG7-dbkBzj
X-Proofpoint-GUID: ypm6VdaXaltFbbOLOgM2SoeG7-dbkBzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDIyNSBTYWx0ZWRfXxBJ4jauUx7jg
 GODDnKI+A7g8OTe9cCfSCrwnEepFpf5eviFJFLYYp8L1mXrDRywDo0yRKtRoPTzKazQ4ONL2uwH
 ZfYg7RhHeagEgbGP/sTfU2nXTdFHVAURbZ5rxc+JeYGj361NyFl2x4vz0R8Qgp24CyKyNfJwOOT
 a3/Xq9zp3pXZqjRWu60T/WjkX3ArvfhMccQJdhzEKWMDJpv1vnCVcOR8MktAs622LjFytBVZxgp
 6Jxv4YZElLBes4l3fDuVNbKEjPp6VjONdK/hFXrLqJOLOK7evqIbBMpzjfL34hrshVYR5SjHU1K
 7jMnheuk7n4lKvPR9j3x2Q4EBHqOcS8EoyB4bZgbf1TQ2lrOTxRpwwRJJGN4rsfVeIWGWsmQwDV
 zRpf+VQMBSVNwDFNflfDppeYm2MI0p+LRoLqDjmOhTOCupKkeHtUblYfVDfac5NpnAHxD0ojTje
 6wtzPXCJSZ02rnerO5g==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=69506da5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gS_xsBWLPIqDcs7Dg6EA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270225
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 27 Dec 2025 23:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9505

Hello,

Our builds stopped to work because the updated nerdctl recipe fails to
remove the sources in do_rm_work, because all the source files now have
0444 permissions (0555 for the directories). Could you possibly take a
look and fix that?

-- 
With best wishes
Dmitry

