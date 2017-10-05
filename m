Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30196E00D90; Thu,  5 Oct 2017 06:39:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09728E00D6D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 06:39:05 -0700 (PDT)
Received: by mail-wm0-f49.google.com with SMTP id u138so2272932wmu.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WDMtYc7+JR21QQLwXj7Tr9EI+iJdmCZ7WQgLyPhhT+w=;
	b=R7Z1tUL0vQ7PoihjwTLQu777ea1QmmlvAJec/mR/MUaeW+iP4GH91WGq0OgO6pFwee
	q9RY0UrWobtXhzmzCAVg44XbSxluSzZJd35asTCOrtgvGqJAzyAuS6sSvhGIVSNe3Hyb
	6P4CCLYUlUCWDEeLH1d9uDTuJjGyEW0cE/hCHpzkGgvINzArWzeCZn3CxXtAzrsaaJoh
	9L23tja0ZywsTKvrdUVsz7kwI+dcSB9VyVZLVUUW/ggGev64gDFJhQpD4mJt+JDyyC7z
	3kZ7bS6oz0jcRe8AdWMo1yKBPYuduEUVjxZtYbHXjUkDfDRyS63xG5JyLVsMouwcfCM0
	88ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WDMtYc7+JR21QQLwXj7Tr9EI+iJdmCZ7WQgLyPhhT+w=;
	b=EO2xt1g8Yy1USQz1eAKrZ9lpgTadWsSS+dvKtizTGX59sQ3nNct/B3WAbR+KCS+sxx
	v6Jn0+YTL0gGaphpeoa0PEwSUFhlML5h9lRwXwW0Anw7lrQVPoEkrXVBwN/N9GC3YPeU
	zq5kBKj9l0N1hXl1vEPIULODMbskuWfEX/sIjwxUd7TZiNUEJnqoyebUM+gnJU2B02RS
	UZY32ubJriqlpTapu7nJlCKTP2c9v6ne8+HKI9/t59Ph9c0je9LzKFESOGQWxZ6Pua1G
	Qf/I4hCPL0whL9qiCxOWHwKlXg5/Aaz0Gd0/MQMAwqk2VnBDVzk18BrOIxiLcCn5Pjje
	RcIA==
X-Gm-Message-State: AMCzsaULM+drmIMJ1fIlG5UZKeeTshpJu/LMHIBCOWOU9Jr0sAWkReWD
	X2uogIgo2Kq/a/bwXQuYrALhySwmOgs=
X-Google-Smtp-Source: AOwi7QBFx+BL9EOcge+IQ32ffnQ6NGR2j6+p0GzoSgXMxlKYSZjJeCY4JDKlEYdeYawoGSXIVYMTTA==
X-Received: by 10.28.63.134 with SMTP id m128mr20556807wma.137.1507210744680; 
	Thu, 05 Oct 2017 06:39:04 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id v3sm6749043wra.39.2017.10.05.06.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Oct 2017 06:39:04 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Oct 2017 13:38:19 +0000
Message-Id: <1507210699-13911-5-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
References: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 4/4] runc: Don't override GOARCH or GOROOT
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
X-List-Received-Date: Thu, 05 Oct 2017 13:39:08 -0000

These variables are now set correctly by go.bbclass in oe-core. Changing them to
point at the native sysroot just leads to build errors in some cases, for
example when the target and host have matching GOARCH but not matching c
libraries.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-containers/runc/runc.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index 83d5f86..b1f2ba8 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -21,8 +21,6 @@ EXTRA_OEMAKE="BUILDTAGS=''"
 inherit goarch
 
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
 	# use dependencies packaged independently.
@@ -34,7 +32,6 @@ do_compile() {
 
 	(cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname})
 	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
-	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
 
 	# Fix up symlink for go-cross compiler
 	rm -f ${S}/src/import/vendor/src
-- 
2.7.4


