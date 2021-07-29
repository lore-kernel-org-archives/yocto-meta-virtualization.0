Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.10675.1627570704974373136
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 07:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JTZA/POa;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id k13so4096195qth.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jul 2021 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XIE4/pn5yLA9HVwAGaafDABE3IIh+TYRJ1e5po4TKoE=;
        b=JTZA/POaffp6GxU88YM26vU3ZGhG+lgUDpOjKGLULrYXvZKJx+eoBCOISYQI7e1VCb
         aQHVJXNoNZ9mybKso7xvKwBMTZR3q5lPt5+Yi0DbJKEieoWwhKrLY/23mk5zEAPZDxI/
         87mHykP+oinjrOkIXlP6vnjoJDZHslzf9fxkNDYVxUAnasr9Nn74jZbFnfedbOnBT30X
         /l6ZFRc1eBHDcYrNJqTN2nmlPw6spVFO1vnI+/KUYKFFjdmMtrb+2BAxWQkNYgYQMn05
         mD/B9Cp1v2TUCyNjSg3pVO0iKa3C2suuTkOuy8HOJZP4zAx3WUusOMIZC2X8uUXkdSwF
         52ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XIE4/pn5yLA9HVwAGaafDABE3IIh+TYRJ1e5po4TKoE=;
        b=in1Ffdr+XWnEP6m1DaIBXpaEbXftdfLwI3wjClekGcqVfRDyeH6YbTup7ee8ugLgnw
         86Yl2QBKO35NPqzE63qiPxEY/IfrrnvGTQsU6eNIKcJlKusvPwiJrqvVLGk+jnTFDTPw
         UMC94zzjRKx/5JspXjI8mEAmcL1jy98gm7BkhZLjki70W1yo4h3sMTkS7deuOc3SsEaf
         z2WHM/5ydx6yxIxJsJaCgrXCoN4ws8F741s6k7U70BC/Z4ebu0IwWoc/t5MzLPVRMK3c
         XYg2wp8Viz9iJMQtb4O9Ch2FlzfqEuCD2M4E5sp3aVKmCkFYK7IyEV1vY1/IpH6RTt8f
         Bpbg==
X-Gm-Message-State: AOAM533LwPdz+0bLmDK2r3Iftzn2dS48bCvHdQFWs7iG9MvGMFvJFcFb
	lndE9kzyw9kej289wcgOJr7fNeL7m+K6NCeP
X-Google-Smtp-Source: ABdhPJzmE/lcK0cHIPdP2dlTJwfLo6aYf2odG/4nWdoMPwsHH8Z0VUavLq0cIDM4xyCZuoNII7YfqQ==
X-Received: by 2002:a05:622a:1998:: with SMTP id u24mr4509518qtc.40.1627570704109;
        Thu, 29 Jul 2021 07:58:24 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id x14sm1299885qtv.17.2021.07.29.07.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 07:58:23 -0700 (PDT)
Date: Thu, 29 Jul 2021 10:58:22 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-2021-20206
Message-ID: <20210729145821.GC40673@gmail.com>
References: <20210728170838.21526-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210728170838.21526-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-2021-20206
on 28/07/2021 sakib.sajal@windriver.com wrote:

> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../kubernetes/CVE-2021-20206.patch           | 92 +++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |  1 +
>  2 files changed, 93 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> new file mode 100644
> index 0000000..dc4e902
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> @@ -0,0 +1,92 @@
> +From 5e8f9a8a72351e2fb5bcea3e3c58c935314557b6 Mon Sep 17 00:00:00 2001
> +From: Navid Shaikh <navids@vmware.com>
> +Date: Thu, 6 May 2021 15:41:08 +0530
> +Subject: [PATCH] Bump containernetworking/cni to v0.8.1
> +
> + Fix CVE-2021-20206
> +CVE: CVE-2021-20206
> +Upstream-Status: Backport [185f65fbddb5239666c0c67fb335589b7570f60c]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + go.mod                                                       | 4 ++--
> + go.sum                                                       | 4 ++--
> + vendor/github.com/containernetworking/cni/pkg/invoke/find.go | 5 +++++
> + vendor/modules.txt                                           | 2 +-
> + 4 files changed, 10 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/import/go.mod b/src/import/go.mod
> +index e0ba549ab40..d4cc9ce01a9 100644
> +--- a/src/import/go.mod
> ++++ b/src/import/go.mod
> +@@ -28,7 +28,7 @@ require (
> + 	github.com/clusterhq/flocker-go v0.0.0-20160920122132-2b8b7259d313
> + 	github.com/codegangsta/negroni v1.0.0 // indirect
> + 	github.com/container-storage-interface/spec v1.2.0
> +-	github.com/containernetworking/cni v0.8.0
> ++	github.com/containernetworking/cni v0.8.1
> + 	github.com/coredns/corefile-migration v1.0.10
> + 	github.com/coreos/go-oidc v2.1.0+incompatible
> + 	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
> +@@ -214,7 +214,7 @@ replace (
> + 	github.com/containerd/go-runc => github.com/containerd/go-runc v0.0.0-20180907222934-5a6d9f37cfa3
> + 	github.com/containerd/ttrpc => github.com/containerd/ttrpc v1.0.2
> + 	github.com/containerd/typeurl => github.com/containerd/typeurl v1.0.1
> +-	github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.0
> ++	github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.1
> + 	github.com/coredns/corefile-migration => github.com/coredns/corefile-migration v1.0.10
> + 	github.com/coreos/bbolt => github.com/coreos/bbolt v1.3.2
> + 	github.com/coreos/etcd => github.com/coreos/etcd v3.3.13+incompatible
> +diff --git a/src/import/go.sum b/src/import/go.sum
> +index 288f4554b1f..9168f49c859 100644
> +--- a/src/import/go.sum
> ++++ b/src/import/go.sum
> +@@ -113,8 +113,8 @@ github.com/containerd/ttrpc v1.0.2 h1:2/O3oTZN36q2xRolk0a2WWGgh7/Vf/liElg5hFYLX9
> + github.com/containerd/ttrpc v1.0.2/go.mod h1:UAxOpgT9ziI0gJrmKvgcZivgxOp8iFPSk8httJEt98Y=
> + github.com/containerd/typeurl v1.0.1 h1:PvuK4E3D5S5q6IqsPDCy928FhP0LUIGcmZ/Yhgp5Djw=
> + github.com/containerd/typeurl v1.0.1/go.mod h1:TB1hUtrpaiO88KEK56ijojHS1+NeF0izUACaJW2mdXg=
> +-github.com/containernetworking/cni v0.8.0 h1:BT9lpgGoH4jw3lFC7Odz2prU5ruiYKcgAjMCbgybcKI=
> +-github.com/containernetworking/cni v0.8.0/go.mod h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
> ++github.com/containernetworking/cni v0.8.1 h1:7zpDnQ3T3s4ucOuJ/ZCLrYBxzkg0AELFfII3Epo9TmI=
> ++github.com/containernetworking/cni v0.8.1/go.mod h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
> + github.com/coredns/corefile-migration v1.0.10 h1:7HI4r5S5Fne749a+JDxUZppqBpYoZK8Q53ZVK9cn3aM=
> + github.com/coredns/corefile-migration v1.0.10/go.mod h1:RMy/mXdeDlYwzt0vdMEJvT2hGJ2I86/eO0UdXmH9XNI=
> + github.com/coreos/bbolt v1.3.2 h1:wZwiHHUieZCquLkDL0B8UhzreNWsPHooDAG3q34zk0s=
> +diff --git a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
> +index e815404c859..e62029eb788 100644
> +--- a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
> ++++ b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
> +@@ -18,6 +18,7 @@ import (
> + 	"fmt"
> + 	"os"
> + 	"path/filepath"
> ++	"strings"
> + )
> + 
> + // FindInPath returns the full path of the plugin by searching in the provided path
> +@@ -26,6 +27,10 @@ func FindInPath(plugin string, paths []string) (string, error) {
> + 		return "", fmt.Errorf("no plugin name provided")
> + 	}
> + 
> ++	if strings.ContainsRune(plugin, os.PathSeparator) {
> ++		return "", fmt.Errorf("invalid plugin name: %s", plugin)
> ++	}
> ++
> + 	if len(paths) == 0 {
> + 		return "", fmt.Errorf("no paths provided")
> + 	}
> +diff --git a/src/import/vendor/modules.txt b/src/import/vendor/modules.txt
> +index 6a263b51686..c3b68a5f547 100644
> +--- a/src/import/vendor/modules.txt
> ++++ b/src/import/vendor/modules.txt
> +@@ -257,7 +257,7 @@ github.com/containerd/containerd/pkg/dialer
> + github.com/containerd/ttrpc
> + # github.com/containerd/ttrpc => github.com/containerd/ttrpc v1.0.2
> + # github.com/containerd/typeurl => github.com/containerd/typeurl v1.0.1
> +-# github.com/containernetworking/cni v0.8.0 => github.com/containernetworking/cni v0.8.0
> ++# github.com/containernetworking/cni v0.8.1 => github.com/containernetworking/cni v0.8.1
> + ## explicit
> + # github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.0
> + github.com/containernetworking/cni/libcni
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index bc694a2..7b9aab8 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -16,6 +16,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.20;name=k
>             file://0001-generate-bindata-unset-GOBIN.patch \
>             file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
>             file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch \
> +           file://CVE-2021-20206.patch \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.32.0
> 

> 
> 
> 

