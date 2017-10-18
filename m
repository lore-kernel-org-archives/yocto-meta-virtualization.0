Return-Path: <dariusz.pelowski@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75FE7E00CEF; Wed, 18 Oct 2017 11:13:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (dariusz.pelowski[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.68 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4B91E00CD3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Oct 2017 11:13:20 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id l23so6818064lfk.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Oct 2017 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7MPaDxRNZwG2Jhi0V+fyr9+e5bVrIQw9tMjuA9+tWIw=;
	b=I0lLoAohCUh3txOMD8XK4jyR7cV1l1mggpHqGABagotmyyeVFLcgWbkhGQe4lKDMDz
	qGj6If3c8F+MJ2DyN/FAvgd5kjMlV8fhOXr/doDvVFudaQMW+7wJRF2k8Ep3bKp6QAPq
	ZFEC4uMsGvIhPQSDYt1HjqH4MzeIDmqGuJq9xPRB0gQa8FRhqWcMCytjs+SYmPqBrqba
	3PUoN0ibON9CSjMsSSPuh2n1p115tIQI8wwegfBct/cO1apZlctiQlnpFuAGxJhmjeiu
	I3a+R/d/8wsdvRvH0S6z/ocB8JIQ188Ae4UuOJpG65ZzUqN06PkvUW0jnlhfh+PQb/pf
	wJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7MPaDxRNZwG2Jhi0V+fyr9+e5bVrIQw9tMjuA9+tWIw=;
	b=XLDYdANCHx3MxcS30yYWbUi9zwfzXgg9K3+y5WJDzLAl0jKNYnqKswg6phYYcDMlrY
	wKl6J56sIzlZ4+KtsM6508nxDYDsxZqHN3EK7ALtC4Px8j9zgIvysquig9USGRS3IrFc
	XV9/U7YTD/J2crnRr/Eht9pRSX+F381kxWRpSIy5jXRcQJ6fR1T9xTlcXyR5WhIx48TG
	Yd45MKWHiq+UUZy0aPfthnRkLDTIscM9XdWDnnUthe1D5PHOzkd+z5e4IMLV/3Vz+f3R
	Hdfk10DFPoRyIjA4LTjt1m0dqM5/a4fdmuFhA4mvbDIkHSWwuJh2FXOjcEWPI49OQ5pW
	Kowg==
X-Gm-Message-State: AMCzsaVwE7QlWSKlwHIhO+vGn1BxcduNCLNID0ee1pZbOLpSpTkCgh5I
	GglzSSPd1zHrwkClHdvvQbu7bVGr
X-Google-Smtp-Source: ABhQp+RUPwe+WL6Sb2U+VOF26G++9syE82l04D6+p4N+AmVEZQ9JmE++gIvrhDTqdzw5hCGmVksy9Q==
X-Received: by 10.25.37.201 with SMTP id l192mr5725278lfl.35.1508350399160;
	Wed, 18 Oct 2017 11:13:19 -0700 (PDT)
Received: from localhost.localdomain (user-188-33-218-82.play-internet.pl.
	[188.33.218.82]) by smtp.gmail.com with ESMTPSA id
	z71sm3219274lje.26.2017.10.18.11.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Oct 2017 11:13:18 -0700 (PDT)
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 18 Oct 2017 20:13:00 +0200
Message-Id: <1508350380-4449-1-git-send-email-dariusz.pelowski@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CADkTA4OK6iVbakeNM_17Fw20wG_am-YQPLQ3yBho0nFAAF3GCw@mail.gmail.com>
References: <CADkTA4OK6iVbakeNM_17Fw20wG_am-YQPLQ3yBho0nFAAF3GCw@mail.gmail.com>
Subject: [PATCH] vgabios: don't override the compiler ldflags
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
X-List-Received-Date: Wed, 18 Oct 2017 18:13:21 -0000

Fix for building biossums on genericx86-64 machine, due to QA issue:
ERROR: QA Issue: No GNU_HASH in the elf binary:
'.../0.7a-r0/packages-split/biossums/usr/bin/biossums' [ldflags]
caused by overriding LDFLAGS variable to empty value in project's makefile.

In consequence there's missing LDFLAGS settings from bitbake (including
-Wl,--hash-style=gnu, which causes showing this QA).

Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
---
 recipes-extended/vgabios/biossums_0.7a.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/vgabios/biossums_0.7a.bb b/recipes-extended/vgabios/biossums_0.7a.bb
index 10bd014..e66bade 100644
--- a/recipes-extended/vgabios/biossums_0.7a.bb
+++ b/recipes-extended/vgabios/biossums_0.7a.bb
@@ -20,6 +20,7 @@ do_configure() {
     # Don't override the compiler or its flags:
     sed 's,^CC,DISABLED_CC,' -i Makefile
     sed 's,^CFLAGS,DISABLED_CFLAGS,' -i Makefile
+    sed 's,^LDFLAGS,DISABLED_LDFLAGS,' -i Makefile
     # Supply the C flags to the compiler:
     sed 's,-o biossums,$(CFLAGS) -o biossums,' -i Makefile
 }
-- 
2.7.4


