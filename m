Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B0F6E00D90; Wed, 18 Sep 2019 10:54:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  2.6 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2EDCE009EA
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:54:41 -0700 (PDT)
Received: by mail-io1-f68.google.com with SMTP id k5so1279444iol.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=r6rNgwBMWWaj64s5W9v8jF64lZ7mKlvjxtFcjYpXxM4=;
	b=vWXPJSe8e+PjAUFdKCQfSIK4CCHn6N3MFKJswTT4avC8i5mSyarJ7sd0p91JVDYs62
	0qf6bXYIFypMQsDXdVlJ2NkqThMgqDP6yE7kqL30EL02e2ffAJi9moPmPJuznusXgaxd
	SVgCog9jb65jR7YJwj/42my9Gl7xhQpf5fUwAALbZbwvdE7+DjZDo3PF8g2AflGeiKN7
	wn//lEns43cvWFd/PC10WSUoUqbxZEbClU2FJ0pll8dS+YfdsazEimi8+A3rC+kG1qfX
	KziomoT7tEI0dSLOM8dQ2W3D+VlnWwMSId3l7j6sLRaB7jUAWn3KrJ3/zU8r26NgRDkO
	/10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=r6rNgwBMWWaj64s5W9v8jF64lZ7mKlvjxtFcjYpXxM4=;
	b=ll73YLfl+zWonSPEwt+mg5wqVcOlXvCntfpVvqt/a1gNbjjcI6QwWbKHmaZLqRDCHk
	vBmFnDNm0jdmwTCGqDFjw788Szgs7keNVrNRJSVVGU8Yu1fy8zBXsOvkBUpTCBzXNruS
	1MUy7y2zb+Ir9EW0xFklOZ9/Kk+P5jzrykR6H8WbooMCKeSbWg0ymbPs3WzQxv40sX9B
	d9zbggvnlwhZ5Pw8wtcTtsmIjhBsewKNzM319IfdZrTtDhikBpvvwUI4XEddjf5Q5Lz+
	A1jeDl4FlbUN42byrmcevwatn+g3v2D0beTFZobxLYlWc3JuIhmfsYQzqxJKUnWMtt5+
	bbRw==
X-Gm-Message-State: APjAAAVX2U0wZv71Ve6m6GNFi5OwHoyZ8PgJBACzKYIgHVxAV2zB/RPt
	H5Ch3QbWzHKFwL/yPPTtJSA3StCXv3/N2w==
X-Google-Smtp-Source: APXvYqxmrxq92bzeydJQvHs+cTCMy29rhf3Dj8TYWgg5j4ytV65hqTu9hvO67QXdG2gOEqTf7SHolA==
X-Received: by 2002:a6b:9109:: with SMTP id t9mr4725947iod.16.1568829281044;
	Wed, 18 Sep 2019 10:54:41 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	u11sm7392064iof.22.2019.09.18.10.54.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 10:54:40 -0700 (PDT)
Date: Wed, 18 Sep 2019 13:54:38 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190918175437.GC22136@gmail.com>
References: <1568705843-26164-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1568705843-26164-1-git-send-email-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kubernetes: fix compiling failure: execvp: /bin/bash: Argument list too long
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
X-List-Received-Date: Wed, 18 Sep 2019 17:54:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] kubernetes: fix compiling failure: execvp: /bin/bash: Argument list too long
on 17/09/2019 Hongxu Jia wrote:

> Use GNU Make 4.2.1(such as fedora-29) to build k8s in a long directory,
> it failed with `execvp: /bin/bash: Argument list too long'
> [snip]
> $ cd /buildarea1/hjia/wrlinux-1019/I_/suspect_/that_/if_/you_/create_/your_/project_/in_/a_/very_/deep_/directory/build_master-wr_qemux86-64_faw_2019090509/build/tmp-glibc/work/core2-64-wrs-linux/kubernetes/v1.16.0-alpha+git7054e3ead7e1a00ca6ac3ec47ea355b76061a35a-r0/kubernetes-v1.16.0-alpha+git7054e3ead7e1a00ca6ac3ec47ea355b76061a35a/src/import
> $ make cross KUBE_BUILD_PLATFORMS=linux/amd64 GOLDFLAGS=""
> |+++ [0804 16:38:32] Building go targets for linux/amd64:
> |    ./vendor/k8s.io/code-generator/cmd/deepcopy-gen
> |make[1]: execvp: /bin/bash: Argument list too long
> |make[1]: *** [Makefile.generated_files:184: pkg/kubectl/cmd/testing/zz_generated.deepcopy.go] Error 127
> |make: *** [Makefile:557: generated_files] Error 2
> ...
> [snip]
> 
> From make manual [1]
> $?
>   The names of all the prerequisites that are newer than the target, with spaces between them.
> 
> While two `$?' was passed to bash in a line, it caused above failure,
> drop a duplicated one could workaround the issue.
> 
> [1] https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...ng-failure-execvp-bin-bash-Argument-list-.patch | 69 ++++++++++++++++++++++
>  recipes-containers/kubernetes/kubernetes_git.bb    |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch b/recipes-containers/kubernetes/kubernetes/0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch
> new file mode 100644
> index 0000000..42fd51a
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch
> @@ -0,0 +1,69 @@
> +From dbca1bfc6ffca8a6536d91a716cb9c5e9bc2f8a0 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 17 Sep 2019 14:43:30 +0800
> +Subject: [PATCH] fix compiling failure: execvp: /bin/bash: Argument list too
> + long
> +
> +Use GNU Make 4.2.1(such as fedora-29) to build k8s in a long directory,
> +it failed with `execvp: /bin/bash: Argument list too long'
> +[snip]
> +$ cd /buildarea1/hjia/wrlinux-1019/I_/suspect_/that_/if_/you_/create_/your_/project_/in_/a_/very_/deep_/directory/build_master-wr_qemux86-64_faw_2019090509/build/tmp-glibc/work/core2-64-wrs-linux/kubernetes/v1.16.0-alpha+git7054e3ead7e1a00ca6ac3ec47ea355b76061a35a-r0/kubernetes-v1.16.0-alpha+git7054e3ead7e1a00ca6ac3ec47ea355b76061a35a/src/import
> +$ make cross KUBE_BUILD_PLATFORMS=linux/amd64 GOLDFLAGS=""
> +|+++ [0804 16:38:32] Building go targets for linux/amd64:
> +|    ./vendor/k8s.io/code-generator/cmd/deepcopy-gen
> +|make[1]: execvp: /bin/bash: Argument list too long
> +|make[1]: *** [Makefile.generated_files:184: pkg/kubectl/cmd/testing/zz_generated.deepcopy.go] Error 127
> +|make: *** [Makefile:557: generated_files] Error 2
> +...
> +[snip]
> +
> +From make manual [1]
> +$?
> +  The names of all the prerequisites that are newer than the target, with spaces between them.
> +
> +While two `$?' was passed to bash in a line, it caused above failure,
> +drop a duplicated one could workaround the issue.
> +
> +[1] https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
> +
> +Upstream-Status: Submitted [https://github.com/kubernetes/kubernetes/pull/82777]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/import/build/root/Makefile.generated_files | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/import/build/root/Makefile.generated_files b/src/import/build/root/Makefile.generated_files
> +index 4892325..f17f1f3 100644
> +--- a/src/import/build/root/Makefile.generated_files
> ++++ b/src/import/build/root/Makefile.generated_files
> +@@ -182,7 +182,7 @@ $(META_DIR)/$(DEEPCOPY_GEN).todo: $(DEEPCOPY_FILES)
> + 
> + $(DEEPCOPY_FILES): $(DEEPCOPY_GEN)
> + 	if [[ "$(DBG_CODEGEN)" == 1 ]]; then        \
> +-	    echo "DBG: deepcopy needed $(@D): $?";  \
> ++	    echo "DBG: deepcopy needed $(@D):";  \
> + 	    ls -lf --full-time $@ $? || true;       \
> + 	fi
> + 	echo $(PRJ_SRC_PATH)/$(@D) >> $(META_DIR)/$(DEEPCOPY_GEN).todo
> +@@ -276,7 +276,7 @@ $(META_DIR)/$(DEFAULTER_GEN).todo: $(DEFAULTER_FILES)
> + 
> + $(DEFAULTER_FILES): $(DEFAULTER_GEN)
> + 	if [[ "$(DBG_CODEGEN)" == 1 ]]; then         \
> +-	    echo "DBG: defaulter needed $(@D): $?";  \
> ++	    echo "DBG: defaulter needed $(@D):";  \
> + 	    ls -lf --full-time $@ $? || true;        \
> + 	fi
> + 	echo $(PRJ_SRC_PATH)/$(@D) >> $(META_DIR)/$(DEFAULTER_GEN).todo
> +@@ -380,7 +380,7 @@ $(META_DIR)/$(CONVERSION_GEN).todo: $(CONVERSION_FILES)
> + 
> + $(CONVERSION_FILES): $(CONVERSION_GEN)
> + 	if [[ "$(DBG_CODEGEN)" == 1 ]]; then          \
> +-	    echo "DBG: conversion needed $(@D): $?";  \
> ++	    echo "DBG: conversion needed $(@D):";  \
> + 	    ls -lf --full-time $@ $? || true;         \
> + 	fi
> + 	echo $(PRJ_SRC_PATH)/$(@D) >> $(META_DIR)/$(CONVERSION_GEN).todo
> +-- 
> +2.7.4
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index cc37796..a0e0e47 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -11,6 +11,7 @@ SRCREV_kubernetes = "7054e3ead7e1a00ca6ac3ec47ea355b76061a35a"
>  SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=master;name=kubernetes \
>             file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
>             file://0001-cross-don-t-build-tests-by-default.patch \
> +           file://0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.7.4
> 

