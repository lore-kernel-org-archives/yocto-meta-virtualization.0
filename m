Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.944.1618598523874600545
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 11:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c9Z7C/+x;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id u8so21451014qtq.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Apr 2021 11:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g7C9ap/uE2WzNmXHSu+8F4354syAepGYbIXVrzaNJks=;
        b=c9Z7C/+xf3602V5b0lzwv6seG3S5i8tj4w4PGsXjFmqff0i72ZnWgjtIB6U+fffRYu
         K+FNEyU0hLKbFKfihuEPrj8lB1XuWJA5b8qfu4ncvHDrJ00WWLfV5SeOUAz7Q8ok6h5C
         a9bvLK5vqCmV/Mi8YBTil6pALvY7nHCa2Co/Q0sCsIcn1gxgtsY3POJdyhno/0ZVXWCl
         Jk6xrjaV6EU1ETS5VcRMeXTKnhm5UWQJck31puenSVqgfvjD2wB/K6CuZiLZFfSx1VS/
         bGKLWMiSeTkOhzWqT342YpKmLr/VPqCYx7VSZdbPLufLmqCOeKA2v+yWSSbJV8ESqHOn
         Q0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g7C9ap/uE2WzNmXHSu+8F4354syAepGYbIXVrzaNJks=;
        b=S5qRgnJJszhhkRlCjFSndgHYmkl7/wukJOYes2Oz9AW7dfNfoc/F9Mhfh8dVYcCror
         c+CMZoMYaQfJIAKerfh+dTUFkxh4/VtKXm9wurZWMthvC65aicysIgc8E1Izr/M11k+8
         FF/8Ta0RS9MDcEbxXDFFTe74cZ3TvH+ZtYWw2YbOn5B18F3uO2ZNYh5zpkxGKyNJGogu
         UfiMCeFmpX6Q22pkDgg/x3BF1m7wPxLJ+MVPUjVut1PUusPqVnWIE6Y1pPkjqTboz6uH
         YQjJAlC8ROwmghk799c4sCYT2rdHEAKBeF8VPwyl710pkkGRmA/RRLITbVbt+M502vUs
         bPJg==
X-Gm-Message-State: AOAM530skha4U9vvzirj4f5/Wnp0mPaYJstocLeijgqkqN3HcXX2iOSA
	Jl538bqu/Nm0uqbz0E6o/pVjJTlb4u6F2Q==
X-Google-Smtp-Source: ABdhPJwIcrFaOEGOr0ReZw/aQpVXk/YOcIE+seQi0ywJ401baH0jX8ap7wMbGpq5hqZvPMjua/u1QA==
X-Received: by 2002:ac8:514c:: with SMTP id h12mr508768qtn.12.1618598522862;
        Fri, 16 Apr 2021 11:42:02 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org ([166.176.185.178])
        by smtp.gmail.com with ESMTPSA id m10sm3922238qtp.43.2021.04.16.11.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:42:02 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH v3 3/6] xen, xen-tools: uprev git recipes after 4.15 release
Date: Fri, 16 Apr 2021 11:41:33 -0700
Message-Id: <20210416184136.71992-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416184136.71992-1-christopher.w.clark@gmail.com>
References: <20210416184136.71992-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated to the branch point for 4.16 development.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 recipes-extended/xen/xen-tools_git.bb | 4 ++--
 recipes-extended/xen/xen_git.bb       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
index 71850ee..0188bdd 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,6 +1,6 @@
-SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
+SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
 
-XEN_REL ?= "4.15"
+XEN_REL ?= "4.16"
 XEN_BRANCH ?= "master"
 
 SRC_URI = " \
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 2b62c5c..eaf3956 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,6 +1,6 @@
-SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
+SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
 
-XEN_REL ?= "4.15"
+XEN_REL ?= "4.16"
 XEN_BRANCH ?= "master"
 
 SRC_URI = " \
-- 
2.25.1

