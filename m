Return-Path: <jkrishnanjanappa@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00754E00CE7; Sat,  7 Jul 2018 10:02:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.218.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 686E3E006F1
	for <meta-virtualization@yoctoproject.org>;
	Sat,  7 Jul 2018 10:02:47 -0700 (PDT)
Received: by mail-oi0-f65.google.com with SMTP id v8-v6so29006930oie.5
	for <meta-virtualization@yoctoproject.org>;
	Sat, 07 Jul 2018 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cvBvL2bHHvy04lipGirUuJ5fQ07pCgGiZg8C98YHrN0=;
	b=OqAFHKoOPppt2rRfP61kOKFyx1qYjCOVOEzVRzIvnVdDKsjwXKyo41QiUOP5ujHg7h
	5yZl9sCv4RDxZMM8PmZVJ17L57z8rxl/oRVrCjgHW//dRqs8427TEQGN20yqgnfgEvMo
	aOljYWlbrYqd6k86M9lIfn49069DT8y5STD/aHUDzn+2RPyaOd6jYPUxear6mf2vs9rm
	dai5+w2S0Wzd4/oPKH+VMdLqkRKI2mmviyeSswjO32NFDHdzr265U1f4RJ6+0/RHvfnn
	3xRqHkAG3a6kAQz3//HotSEbO3+p5YFr+/ZxWKuyAtsU8lMd11S2etCoD9UARnPNfMgq
	xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cvBvL2bHHvy04lipGirUuJ5fQ07pCgGiZg8C98YHrN0=;
	b=hWtMHPR0aeoKJzT/OsI/Zjmpchz6TRiOmZcQpJtF3rVmch3MUtMTLsQ7RseZIH+QP3
	wpMJ0UnXEUs+iL0sjJS/xmYd+39Z5TmJDp1wFVcUEWIQbskU1aDyZ/deabz6g3FGKGcP
	SArzLFTkSnTfdJoLdpteRdOmE8ivWUYNPCVtux+A7WZo+28Wd79rNyV02H7laFG8aE1E
	p/BbNqnv9nluU4lI+kccxxskqLNRMP+zz4DB4fWiWPRFoNgaiImPWEfrgLUsIRSrfdjZ
	nBQj80KoU1nhdjI8Fz71J87wsRgJ0v3wIAGFM53V1M7KXAeTHC7KyuHcGjTUqF0eNtK8
	MMCg==
X-Gm-Message-State: APt69E26XE4ytc4yBG7CD0GmRUhAYhWp131BadiXkxQbNanEPZov9M5W
	bwREt7LIkfPhR2p3+gZLGlGo97pymos=
X-Google-Smtp-Source: AAOMgpfM3QVIKJODB+HEjcSbzmoySVjY+i7P9GAlkzEADGWlAlxhneyZZJIdnaqZfrPOhJ2vM/xwxQ==
X-Received: by 2002:aca:4083:: with SMTP id
	n125-v6mr17474306oia.167.1530982966709; 
	Sat, 07 Jul 2018 10:02:46 -0700 (PDT)
Received: from jagadeesh-TravelMate-4740.mvista.com
	([2405:204:5403:8d8d:8c9d:7ec1:c798:feb])
	by smtp.gmail.com with ESMTPSA id
	y85-v6sm922633oie.25.2018.07.07.10.02.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Jul 2018 10:02:46 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Sat,  7 Jul 2018 22:32:37 +0530
Message-Id: <1530982957-5021-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [m-c-s][master][sumo][rocko][PATCH] tgt: Use return instead of exit to restart tgtd, if tgtd is not running
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jul 2018 17:02:50 -0000

If the tgtd daemon is stopped, then '/etc/init.d/tgtd.init restart'
does not start the new tgtd daemon, as the control comes out from the
stop function, if it finds tgtd is not running.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta-openstack/recipes-support/tgt/files/tgtd.init | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-support/tgt/files/tgtd.init b/meta-openstack/recipes-support/tgt/files/tgtd.init
index 350fd0c..4b0ce94 100644
--- a/meta-openstack/recipes-support/tgt/files/tgtd.init
+++ b/meta-openstack/recipes-support/tgt/files/tgtd.init
@@ -57,11 +57,11 @@ stop ()
     RETVAL=$?
     if [ "$RETVAL" -eq 107 ] ; then
         if [ "$TASK" != "restart" ] ; then
-            exit 1
+            return 1
         fi
     elif [ "$RETVAL" -ne 0 ] ; then
         echo "Some initiators are still connected - could not stop tgtd"
-        exit 2
+        return 2
     fi
     echo -n
 }
-- 
2.7.4


