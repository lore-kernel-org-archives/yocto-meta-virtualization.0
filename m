Return-Path: <limon.anibal@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26FADE00D62; Mon,  9 Oct 2017 12:54:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (limon.anibal[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.43 listed in dnsbl.sorbs.net]
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0037EE00D5D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Oct 2017 12:54:30 -0700 (PDT)
Received: by mail-oi0-f43.google.com with SMTP id g125so24142621oib.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Oct 2017 12:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MTGwWlG5DzubjvCOkqkwt6HVc3GQAa5YmLNRSTAcONg=;
	b=rHkC9opSihWDhrkWztz1V+BjB9jC1sFf9HU6sSJP7/wy7cPJ/NNn4SejTB+Hjjphvd
	heklmtqLXDaUAXRZwcmxACGkQsq1hTxfkfcEb0E81xqk/NaEOOOVu0vd9KsdJBrB+uoX
	u+hm8WKX1vnILXoySKgEM6VxdP6BQ2CpLXiK/vzfQiwflqm2SXAdcVUsEqYH9DYRwlKg
	0ByKshuQ2aiBkZT4DUpFwVAWsxMqf0A6tUkRIS2Ub71wsIxZ6vdXCKOMBLrRtttj+UfL
	vaAMyp4bBDB3XgO+0gdD9dOpGgB1EF3TZpxYmn+PGL5ozVmCD1cVIyHulXf+sg//sTgl
	uUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MTGwWlG5DzubjvCOkqkwt6HVc3GQAa5YmLNRSTAcONg=;
	b=DmCWTozBnZb+MHER4pwvUkHr0ByJatswwt1Wiq6mexLJRiCFar8R7akRZwW8O7aYEg
	3DIIRKy3uL0TMPyE0q5xWqZ4TIROmMbFL7u8uFwswrDgYpp93+rUyiWA6nVRWMbLQmaZ
	7txFlnB5sk5eZEBVczmNuLM51gaBOmLXRziJ97gZ9s75Lrga193CwWQuKsDVRo3VOh3K
	wqNpyI1oPtRElvVb2//jBEs9zg58FYga4G43uNbYTdOVxJnvgl4T17EWTMXVs62Slpwi
	pSni5zZOPxka5GIipl2pUUV9nLpmOcn8lP8YclMQhZkavGJ90QoWA0i27YZypRvGoe9O
	yZNg==
X-Gm-Message-State: AMCzsaWDv7IlTy+vG9aZdAHd17NYFw8GnTQKMpyAcgUBzCIU+KCZbUSK
	+MtL3dNUBI9TI4FBN6r7kockZg==
X-Google-Smtp-Source: AOwi7QClVS1yzEzx6PhUNNh2mha+3RH67GJna8d9ZVKBTRqyLpGGrFbcCQrD86J6a33VabGnxvhPxA==
X-Received: by 10.202.217.4 with SMTP id q4mr5882521oig.283.1507578869616;
	Mon, 09 Oct 2017 12:54:29 -0700 (PDT)
Received: from localhost.localdomain ([148.240.201.158])
	by smtp.gmail.com with ESMTPSA id r12sm5217235otr.1.2017.10.09.12.54.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Oct 2017 12:54:28 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  9 Oct 2017 14:54:21 -0500
Message-Id: <20171009195421.17393-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] Revert "runc: Don't override GOARCH or GOROOT"
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
X-List-Received-Date: Mon, 09 Oct 2017 19:54:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

This reverts commit fdee07aadc1b5224a540c7e8893144207e1979cb.

Causes build failures when is cross-compiling to aarch64,

| CGO_ENABLED=1 aarch64-linaro-linux-go build -i  -tags " cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit="9d6821d1b53908e249487741eccd567249ca1d99-dirty" -X main.version=1.0.0-rc3 " -o runc .
...
| /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/aarch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-native/usr/lib/aarch64-linaro-linux/go/pkg/tool/linux_amd64/link: running aarch64-linaro-linux-gcc failed: exit status 1
| /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/aarch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-native/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aarch64-linaro-linux/7.1.1/ld: cannot find crt1.o: No such file or directory
| /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/aarch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-native/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aarch64-linaro-linux/7.1.1/ld: cannot find crti.o: No such file or directory
| /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/aarch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-native/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aarch64-linaro-linux/7.1.1/ld: cannot find crtbeginT.o: No such file or directory
...

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 recipes-containers/runc/runc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index b1f2ba8..83d5f86 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -21,6 +21,8 @@ EXTRA_OEMAKE="BUILDTAGS=''"
 inherit goarch
 
 do_compile() {
+	export GOARCH="${TARGET_GOARCH}"
+	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
 	# use dependencies packaged independently.
@@ -32,6 +34,7 @@ do_compile() {
 
 	(cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname})
 	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
 
 	# Fix up symlink for go-cross compiler
 	rm -f ${S}/src/import/vendor/src
-- 
2.11.0


