Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.3326.1625185957321623941
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Jul 2021 17:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nknnUVbp;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id j184so7879198qkd.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Jul 2021 17:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KjZfUWcdgPcaB4uQZxThAyIp+FJ0M1T2pOPx7Bt7fek=;
        b=nknnUVbpYyInmBbzbq9gK5gpx04R51jEqpWfpugmH4fI2L7np9ogwOGf2FeQ8zlvrt
         lrLtt+C7Js5wc2R8UNXng9Y5f0m0pj3Qadlk1HsCu+p+Qj8lsU8fHFs6jjSA8fOgw2wS
         UtjiUmvzuu8pxxS0VUYhmx6Q70cFy/Tbw29DN8ylgsnDPIoqAIgF+V6Zi2tRdS2c8ti5
         xUkigZ0orX/6CHjZyDPqu6iLi+vVcsMvyG2W+oYFONrRhhqXslIEl0wp5w//ahhnKh/x
         YvXBSEG0TV/jp+/3c+/9xl8UthxVkXFaU7X4XOjpqpsqG98ulh4xlrfvFBHzxX2IptSx
         Mr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KjZfUWcdgPcaB4uQZxThAyIp+FJ0M1T2pOPx7Bt7fek=;
        b=sQHo6Re1pmBUcO+pkKj/eIk985IUFT9XXck8BsNaf5kSrObrpKhhOQXoe8jEEQKfD+
         0gWiwDgOKeLycY5gKS9ur/2MAGVk4StSyXVGj9cKE+GqX40Ue9HhWSjZn5bDGX74RLlo
         zmclo6KsUpidkYq/7PX23ACagMTHjCvq40kU4l2IeNx/Xgfq045brNUTNdmIsPsaywZO
         +UT9MDYmXmgTTW8hXuqAUbxdAKeEu7SGGKKeDqMgRO5gBvYY+50Y/iMzk03hKXiNgR7r
         Hk6kZvK+c6CdNr4OiMEqmxbXo7db+rotKIYfa/wBhH1f+vaW/O+yHcNeKMzi+thtQVfK
         bd8Q==
X-Gm-Message-State: AOAM533HkRFJOZKIOoTamFmoeB5Ptg+w9S0vc/RAAmll71ohdrzfR9z1
	QRTuUouj9zDXt4LgTUhSRl5GTCqpc4vKFg==
X-Google-Smtp-Source: ABdhPJxhMzQdMXVZ1vnpoIAdYSfIf8vGHX/YKSD4D53hNYARxshSBEZR880VLoqQtTHJ2fG8igdG9A==
X-Received: by 2002:a37:a513:: with SMTP id o19mr2726087qke.347.1625185956437;
        Thu, 01 Jul 2021 17:32:36 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-137-178-102.mycingular.net. [166.137.178.102])
        by smtp.gmail.com with ESMTPSA id x16sm621135qtw.80.2021.07.01.17.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 17:32:36 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com
Subject: [meta-virtualization][PATCH 3/3] xtf: fix build with gcc11 SRCREV and specifying linker
Date: Thu,  1 Jul 2021 17:32:06 -0700
Message-Id: <20210702003206.79756-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702003206.79756-1-christopher.w.clark@gmail.com>
References: <20210702003206.79756-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer XTF revision works around GCC 11.1 issue 99578 and
supplying the correct linker to use fixes the build.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xtf_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
index 3580324..bf7470e 100644
--- a/recipes-extended/xen/xtf_git.bb
+++ b/recipes-extended/xen/xtf_git.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 # https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017/79/xtf.pdf
 
 SRC_URI = "git://xenbits.xen.org/xtf"
-SRCREV = "b0bc49846c154b79243f39d461a4515804bcaf53"
+SRCREV = "3e800027016ea4eb19887bf626b46f45fc43fa5d"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux'
 
@@ -32,6 +32,7 @@ RDEPENDS_${PN} = " \
 do_compile() {
     oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
                CPP="${CPP}" \
+               LD="${LD}" \
                OBJCOPY="${OBJCOPY}" \
                PYTHON="${PYTHON}"
     # switch the shebang to python3
-- 
2.25.1

