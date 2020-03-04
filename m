Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.2947.1583283759971599554
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2020 17:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eLRmy+/1;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id p3so79781qvq.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2020 17:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RphIjQcNZu/UbvrRz8xl3fwVtOBJAgwSmw9hs2cIm3M=;
        b=eLRmy+/1196H/vOxjT2zD3uniL6kbi9HeoemHE2XQgrD5NGqqEzYRR9G9wS87yVYfK
         Ha6BaHtqL7dhmpe3Qtb8SMHq3pjTbR2yMotPkgNQ0RDjaoZ8HH3Kdi/M/CVTLeqZibaB
         mUu4a5nJCdJtbGHVOlPZXLBRC0h7aLKT84vR4IHJ1HU3INmTYNJNW+nMD+FMRVNTtm5G
         0tgdReBcI4y6XiEtV30iaZSFZ7LSyUQaBg7ZRFDvP05AyQHy88ilpbwxd0aJHYPO4QIR
         Tkni73cSASrK+2qDlel4QqqfKtW1a2+9xGKehhUII05awdClbpmGCexwhbsv8bSM5B6V
         ry2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RphIjQcNZu/UbvrRz8xl3fwVtOBJAgwSmw9hs2cIm3M=;
        b=fiWMnuAdR1CC6t0jzosBxH6WtCzjYDI21pa0cfwuxcOgpJydREZFv8ZLUiNiGCWArq
         0qENMlui+xpmcgTzbSLyFnvmeh11WQYi4dpGDf5kR20+HpAefuPenM/prCOOryr1/NJx
         3iLissc1rMuR8XV1nHA4zLxaMe474dlbWPuK5xd6O+Z46A9G3/wSGCHpECoNBtW/HKwS
         ld7l5vrRGoM7h/lqGtqELbDrQrSFeKITc48neO3niiqEEmS9ffJqgvxP2BN57c87q+we
         wGxCM0zxQP2hk7URNbZPIE8U2m0kWfXn1xcrTWkjNYsvoQ0sVpkKCJgXLAmfsdQ+Lit0
         9IkA==
X-Gm-Message-State: ANhLgQ1+8JlHTS9viWZUquCak3fIAEviDbpjy15mQrqEP6ga6hEjzd74
	h3PDmA9DigDcXflXGkLpoaw=
X-Google-Smtp-Source: ADFU+vvCH74rthrBo4NUKeM98dzfJLhbyK2quTWYxAuFziVqsPkbzUNw6yUKBOuYWhvxonpzA7BK9g==
X-Received: by 2002:a0c:dc0e:: with SMTP id s14mr195915qvk.103.1583283759008;
        Tue, 03 Mar 2020 17:02:39 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id z189sm13186041qkb.131.2020.03.03.17.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 17:02:38 -0800 (PST)
Date: Tue, 3 Mar 2020 20:02:36 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] docker-moby: fix DOCKER_GITCOMMIT
Message-ID: <20200304010233.GA39743@gmail.com>
References: <20200303221135.21336-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200303221135.21336-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH 1/2] docker-moby: fix DOCKER_GITCOMMIT
on 03/03/2020 Martin Jansa wrote:

> * SRCREV_docker isn't defined in docker-moby recipes at all
>   so it passes unexpanded ${SRCREV_docker} as noticed in
>   error log:
> 
>   | ERROR: Execution of 'work/raspberrypi4-oe-linux-gnueabi/docker-moby/19.03.6+git71373c6105e3cbc9702935b96d8ee01214c405e7-r0/temp/run.do_compile.31754' failed with exit code 2:
>   |
>   | Package devmapper was not found in the pkg-config search path.
>   | Perhaps you should add the directory containing `devmapper.pc'
>   | to the PKG_CONFIG_PATH environment variable
>   | No package 'devmapper' found
>   | Removing bundles/
>   |
>   | ---> Making bundle: dynbinary (in bundles/dynbinary)
>   | Building: bundles/dynbinary-daemon/dockerd-19.03.6
>   | GOOS="linux" GOARCH="arm" GOARM="7"
>   | # runtime/cgo
>   | exec: "arm-linux-gnueabihf-gcc": executable file not found in $PATH
>   | WARNING: work/raspberrypi4-oe-linux-gnueabi/docker-moby/19.03.6+git71373c6105e3cbc9702935b96d8ee01214c405e7-r0/temp/run.do_compile.31754:1 exit 2 from 'VERSION="19.03.6" DOCKER_GITCOMMIT="${SRCREV_docker}" ./hack/make.sh dynbinary'
>   | ERROR: Task (meta-virtualization/recipes-containers/docker/docker-moby.bb:do_compile) failed with exit code '1'
> 
>   this build issue is somehow caused by recent upgrade:
>   http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=f770151b3ff0938bea4972abdd1ee7f6cbc3a074
>   and this build error is not fixed by this change, but
>   see 2nd to last line which shows
>   DOCKER_GITCOMMIT="${SRCREV_docker}"

.. and even stranger, the x86 builds are unconcerned with this, since runtime
testing passed.

Definitely wrong though, and this is merged.

Bruce

> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/docker/docker-moby.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
> index b29c4b3..a8c5946 100644
> --- a/recipes-containers/docker/docker-moby.bb
> +++ b/recipes-containers/docker/docker-moby.bb
> @@ -101,14 +101,14 @@ do_compile() {
>  	# this is the unsupported built structure
>  	# that doesn't rely on an existing docker
>  	# to build this:
> -	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_docker}" ./hack/make.sh dynbinary
> +	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_moby}" ./hack/make.sh dynbinary
>  
>          # build the cli
>  	cd ${S}/src/import/.gopath/src/github.com/docker/cli
>  	export CFLAGS=""
>  	export LDFLAGS=""
>  	export DOCKER_VERSION=${DOCKER_VERSION}
> -	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_docker}" make dynbinary
> +	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_moby}" make dynbinary
>  
>  	# build the proxy
>  	cd ${S}/src/import/.gopath/src/github.com/docker/libnetwork
> -- 
> 2.20.1
> 

> 

