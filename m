Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.15578.1627876070734303051
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 20:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EtEZLvGA;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id c9so15428349qkc.13
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 01 Aug 2021 20:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WlG/y8LRB+d+Drw8R5DKcjPBoZOlBJDSgBc9gU0StZU=;
        b=EtEZLvGACiwF+blQ9M7WTMTRCuhLnde69ajQZz1onHW670nkuDUn1oX+t1kBmuJ04Z
         PdxlswOl0Sy0uEk2EYZ8ApEmuCMF9bEwGAFH8H4HY8kZLZAXUGZDkPHQx/8SKEX5h729
         0aVghOStxcsQHTh/Uth+m9ef1iXgoZHCufJjZJq1UTuHkS4mWWD51vdKqMl/su8wp+32
         xYIKzpweV1Q615F8sPb38SSaHyYJuWZc0yW89F1WUAgWcwvhmhw8EDYVETEaabIJv0tk
         EKeFvTC6kgpQAsqkqhHhOPpPWZLdi7bXLlF3vvHLUhdKMJeUTUiP0k+aOKSL+KH3eCXe
         CCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WlG/y8LRB+d+Drw8R5DKcjPBoZOlBJDSgBc9gU0StZU=;
        b=pDoq3lChK8wU2W1H8mgA0/NrrQP8ZQt7ADRt+MFEF5/C/szvi7ulRJxVTLcrDWviy8
         KTpyE54Q/hpr7i5bQHAgDoTGhqXTTC7xRzpqY44A9egLV86N3WzFNdWPtT2TSTYcFOFY
         OvkdHvYY62cKwLNSgq6C8DbVouQLyQeplldSMgbMIqRBISvEeyIFefWtkhk1Uxxgc3lM
         FJarNq8R21moV29UtGrm+/7hBfqDlfmPEhkMiZjBdGJhzjVH5b2PQWoXsywGg6typl8t
         NLzJPWHPUA6+g3TFGN4wzS1qwJjNb25D5z+FsnAYC8lL1px1caWrEemMFcTR+p0xNEkO
         QFYw==
X-Gm-Message-State: AOAM530+8bRMZO+gF1nhUjvDDgnRhuYGlut4AOLTpI1jZGeDDz1OAonC
	ryLMyv0Gj/XwFnxlEWkt1pk=
X-Google-Smtp-Source: ABdhPJzqXpMjQ79p4031yW8VQf7fPP9ydimlgkSM5qfJC77dJN8OsX8fdCY3hFRVVrYkqoq5lJmCRA==
X-Received: by 2002:a05:620a:99b:: with SMTP id x27mr14017698qkx.138.1627876069831;
        Sun, 01 Aug 2021 20:47:49 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id 28sm5311292qkp.26.2021.08.01.20.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 20:47:49 -0700 (PDT)
Date: Sun, 1 Aug 2021 23:47:47 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Ruslan Babayev (fib)" <fib@cisco.com>
Cc: "sakib.sajal@windriver.com" <sakib.sajal@windriver.com>,
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-2021-20206
Message-ID: <20210802034747.GB16820@gmail.com>
References: <20210728170838.21526-1-sakib.sajal@windriver.com>
 <20210729145821.GC40673@gmail.com>
 <SJ0PR11MB47848F36E8CF4CD2EA403678ADEC9@SJ0PR11MB4784.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SJ0PR11MB47848F36E8CF4CD2EA403678ADEC9@SJ0PR11MB4784.namprd11.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: RE: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-2021-20206
on 30/07/2021 Ruslan Babayev (fib) wrote:

> Thanks Bruce!
> 
> Can this be cherry-picked into Dunfell and other branches as well?

Was this meant to be in reply to the python bbappend patch you
had sent ? I assume so, since this one obviously cannot be
cherry picked.

Bruce


> 
> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield
> Sent: Thursday, July 29, 2021 7:58 AM
> To: sakib.sajal@windriver.com
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-2021-20206
> 
> merged.
> 
> Bruce
> 
> In message: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-2021-20206 on 28/07/2021 sakib.sajal@windriver.com wrote:
> 
> > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > ---
> >  .../kubernetes/CVE-2021-20206.patch           | 92 +++++++++++++++++++
> >  .../kubernetes/kubernetes_git.bb              |  1 +
> >  2 files changed, 93 insertions(+)
> >  create mode 100644 
> > recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> > 
> > diff --git 
> > a/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch 
> > b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> > new file mode 100644
> > index 0000000..dc4e902
> > --- /dev/null
> > +++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> > @@ -0,0 +1,92 @@
> > +From 5e8f9a8a72351e2fb5bcea3e3c58c935314557b6 Mon Sep 17 00:00:00 
> > +2001
> > +From: Navid Shaikh <navids@vmware.com>
> > +Date: Thu, 6 May 2021 15:41:08 +0530
> > +Subject: [PATCH] Bump containernetworking/cni to v0.8.1
> > +
> > + Fix CVE-2021-20206
> > +CVE: CVE-2021-20206
> > +Upstream-Status: Backport [185f65fbddb5239666c0c67fb335589b7570f60c]
> > +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > +---
> > + go.mod                                                       | 4 ++--
> > + go.sum                                                       | 4 ++--
> > + vendor/github.com/containernetworking/cni/pkg/invoke/find.go | 5 +++++
> > + vendor/modules.txt                                           | 2 +-
> > + 4 files changed, 10 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/src/import/go.mod b/src/import/go.mod index 
> > +e0ba549ab40..d4cc9ce01a9 100644
> > +--- a/src/import/go.mod
> > ++++ b/src/import/go.mod
> > +@@ -28,7 +28,7 @@ require (
> > + 	github.com/clusterhq/flocker-go v0.0.0-20160920122132-2b8b7259d313
> > + 	github.com/codegangsta/negroni v1.0.0 // indirect
> > + 	github.com/container-storage-interface/spec v1.2.0
> > +-	github.com/containernetworking/cni v0.8.0
> > ++	github.com/containernetworking/cni v0.8.1
> > + 	github.com/coredns/corefile-migration v1.0.10
> > + 	github.com/coreos/go-oidc v2.1.0+incompatible
> > + 	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
> > +@@ -214,7 +214,7 @@ replace (
> > + 	github.com/containerd/go-runc => github.com/containerd/go-runc v0.0.0-20180907222934-5a6d9f37cfa3
> > + 	github.com/containerd/ttrpc => github.com/containerd/ttrpc v1.0.2
> > + 	github.com/containerd/typeurl => github.com/containerd/typeurl v1.0.1
> > +-	github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.0
> > ++	github.com/containernetworking/cni => 
> > ++github.com/containernetworking/cni v0.8.1
> > + 	github.com/coredns/corefile-migration => github.com/coredns/corefile-migration v1.0.10
> > + 	github.com/coreos/bbolt => github.com/coreos/bbolt v1.3.2
> > + 	github.com/coreos/etcd => github.com/coreos/etcd 
> > +v3.3.13+incompatible diff --git a/src/import/go.sum 
> > +b/src/import/go.sum index 288f4554b1f..9168f49c859 100644
> > +--- a/src/import/go.sum
> > ++++ b/src/import/go.sum
> > +@@ -113,8 +113,8 @@ github.com/containerd/ttrpc v1.0.2 
> > +h1:2/O3oTZN36q2xRolk0a2WWGgh7/Vf/liElg5hFYLX9
> > + github.com/containerd/ttrpc v1.0.2/go.mod 
> > +h1:UAxOpgT9ziI0gJrmKvgcZivgxOp8iFPSk8httJEt98Y=
> > + github.com/containerd/typeurl v1.0.1 
> > +h1:PvuK4E3D5S5q6IqsPDCy928FhP0LUIGcmZ/Yhgp5Djw=
> > + github.com/containerd/typeurl v1.0.1/go.mod 
> > +h1:TB1hUtrpaiO88KEK56ijojHS1+NeF0izUACaJW2mdXg=
> > +-github.com/containernetworking/cni v0.8.0 
> > +h1:BT9lpgGoH4jw3lFC7Odz2prU5ruiYKcgAjMCbgybcKI=
> > +-github.com/containernetworking/cni v0.8.0/go.mod 
> > +h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
> > ++github.com/containernetworking/cni v0.8.1 
> > ++h1:7zpDnQ3T3s4ucOuJ/ZCLrYBxzkg0AELFfII3Epo9TmI=
> > ++github.com/containernetworking/cni v0.8.1/go.mod 
> > ++h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
> > + github.com/coredns/corefile-migration v1.0.10 
> > +h1:7HI4r5S5Fne749a+JDxUZppqBpYoZK8Q53ZVK9cn3aM=
> > + github.com/coredns/corefile-migration v1.0.10/go.mod 
> > +h1:RMy/mXdeDlYwzt0vdMEJvT2hGJ2I86/eO0UdXmH9XNI=
> > + github.com/coreos/bbolt v1.3.2 
> > +h1:wZwiHHUieZCquLkDL0B8UhzreNWsPHooDAG3q34zk0s=
> > +diff --git 
> > +a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/fin
> > +d.go 
> > +b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/fin
> > +d.go index e815404c859..e62029eb788 100644
> > +--- 
> > +a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/fin
> > +d.go
> > ++++ b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke
> > ++++ /find.go
> > +@@ -18,6 +18,7 @@ import (
> > + 	"fmt"
> > + 	"os"
> > + 	"path/filepath"
> > ++	"strings"
> > + )
> > + 
> > + // FindInPath returns the full path of the plugin by searching in 
> > +the provided path @@ -26,6 +27,10 @@ func FindInPath(plugin string, paths []string) (string, error) {
> > + 		return "", fmt.Errorf("no plugin name provided")
> > + 	}
> > + 
> > ++	if strings.ContainsRune(plugin, os.PathSeparator) {
> > ++		return "", fmt.Errorf("invalid plugin name: %s", plugin)
> > ++	}
> > ++
> > + 	if len(paths) == 0 {
> > + 		return "", fmt.Errorf("no paths provided")
> > + 	}
> > +diff --git a/src/import/vendor/modules.txt 
> > +b/src/import/vendor/modules.txt index 6a263b51686..c3b68a5f547 100644
> > +--- a/src/import/vendor/modules.txt
> > ++++ b/src/import/vendor/modules.txt
> > +@@ -257,7 +257,7 @@ github.com/containerd/containerd/pkg/dialer
> > + github.com/containerd/ttrpc
> > + # github.com/containerd/ttrpc => github.com/containerd/ttrpc v1.0.2  
> > +# github.com/containerd/typeurl => github.com/containerd/typeurl 
> > +v1.0.1 -# github.com/containernetworking/cni v0.8.0 => 
> > +github.com/containernetworking/cni v0.8.0
> > ++# github.com/containernetworking/cni v0.8.1 => 
> > ++github.com/containernetworking/cni v0.8.1
> > + ## explicit
> > + # github.com/containernetworking/cni => 
> > +github.com/containernetworking/cni v0.8.0  
> > +github.com/containernetworking/cni/libcni
> > +--
> > +2.25.1
> > +
> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb 
> > b/recipes-containers/kubernetes/kubernetes_git.bb
> > index bc694a2..7b9aab8 100644
> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> > @@ -16,6 +16,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.20;name=k
> >             file://0001-generate-bindata-unset-GOBIN.patch \
> >             file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
> >             
> > file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch 
> > \
> > +           file://CVE-2021-20206.patch \
> >            "
> >  
> >  DEPENDS += "rsync-native \
> > --
> > 2.32.0
> > 
> 
> > 
> > 
> > 
> 
