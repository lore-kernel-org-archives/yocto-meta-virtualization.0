Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.2418.1586401719127322643
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 20:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m6kr476F;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id k9so4133913qvw.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Apr 2020 20:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=vG+U+6iZDVffsxePQcOnCKj60LNuCnN4WkQfZFUdIko=;
        b=m6kr476Ffo1ASEfqUUKclHHov3tAF1Uf0Zog6NGxApBjCO0j0fmpkdfBml3KdyJDHd
         idpJY9WZ9cWahpD6Q1k2mYIpxaDkZZKtmNTL35YMb1dU7QWEx0HXt1KOcoJQ7rXGFm3l
         Foc5zv+FCejH3PmpXGniJiccl98Pc+UhXcDnseGcxCLtVBJx5tYlleZ7eg1ipIqnjsk/
         F9+Xp3V070dtafEpUuecHlQ6SF4JVUn16z8c2RWAUiEGUb1Jn/fOFBSVLGb4Ayd+NzDM
         FMDR4Pk1ocTfBrZMwSHjtHCBqtol0LXOcx65+S/LfxYQpB0sN1gNgSqiMw+UrWMySzhP
         IvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vG+U+6iZDVffsxePQcOnCKj60LNuCnN4WkQfZFUdIko=;
        b=mPecyF/YVwGBdAClkmw1+4XEZ8BmWooxIJAWy4Va1cQ3IJAtlwHKWo7qP4AhV+WEwr
         HTq2i8cAvx22mdxctBka8qQRRKaket/jbrCf735x468sfjzmsyEi5UHMtpcDu9GThOA/
         SYcwgCZs075ZuQ4AG4EiUFkvxpJXi7Nv5l4wWvQXQIL3aS/IN6CeD4AkvAEVMbPn5hW+
         JnNjtoeHxSrXk3YnDmw4M4towu8iohoTyOI2yD7TH06s1QrMBroToFLmfsk/8Vfw7rUd
         anSxxySq9fzuKk7m82mxoaIzYv7KzjyFBWs0nvMTPq0plOM1BByoC4HBUjUHjVQqGge/
         Iodw==
X-Gm-Message-State: AGi0PuZqLsbrBI6KYPLEis9jQ9+ZX7LfyckGWMivrY/qKT5H0Dys+uPQ
	1HvOvqhooB0VZ+4cIDQ23P8=
X-Google-Smtp-Source: APiQypLqLp4YFF0psRAMBfXdpEnv3AXFZwxVkGyFM6pp+qGVEqt+z0ylDnwDAdWSg4RXt6P8PFvxRg==
X-Received: by 2002:ad4:48c7:: with SMTP id v7mr2776508qvx.138.1586401718044;
        Wed, 08 Apr 2020 20:08:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t24sm5819594qkj.23.2020.04.08.20.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 20:08:37 -0700 (PDT)
Date: Wed, 8 Apr 2020 23:08:35 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chandana kalluri <ckalluri@xilinx.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>,
	Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [meta-virtualization][master][PATCH 1/2] go-build: Set up dependencies and GOPATH before do_compile
Message-ID: <20200409030834.GA9313@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1586364761-16281-2-git-send-email-chandana.kalluri@xilinx.com>
 <1586364761-16281-1-git-send-email-chandana.kalluri@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization][master][PATCH 1/2] go-build: Set up dependencies and GOPATH before do_compile
on 08/04/2020 Chandana kalluri wrote:

> go-build recipe depends on runc source and during compilation tries to run the
> command: go get github.com/opencontainers/runc.
> 
> This is incorrect as a source fetch shouldn't occur during compilation.  Also,
> even after a fetch occurs during compilation, the go build path GOPATH points
> to the incorrect path hence the runc source is never found.
> 
> Fetch the opencontainers/runc source and create links in the correct GOPATH
> before compilation for a successful build.
> 
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> ---
>  recipes-devtools/go/go-build_git.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/go-build_git.bb
> index c11ad99..f94a722 100644
> --- a/recipes-devtools/go/go-build_git.bb
> +++ b/recipes-devtools/go/go-build_git.bb
> @@ -3,8 +3,11 @@ SUMMARY = "console for runx"
>  DESCRIPTION = "Xen Runtime for OCI"
>  
>  SRCREV_runx = "da0c75c58ae5232d19b1791c33545db3225e1ea9"
> +SRCREV_runc = "e4363b038787addfa12e8b0acf5417d4fba01693"
> +
>  SRC_URI = "\
>  	  git://github.com/lf-edge/runx;nobranch=1;name=runx \
> +	  git://github.com/opencontainers/runc.git;nobranch=1;destsuffix=runc;name=runc \
>  	  "
>  SRC_URI[md5sum] = "0d701ac1e2a67d47ce7127432df2c32b"
>  SRC_URI[sha256sum] = "5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769"
> @@ -29,6 +32,9 @@ do_compile() {
>  
>      export GOARCH="${TARGET_GOARCH}"
>      cd ${S}/src/import/gobuild
> +    mkdir -p go/src/github.com/opencontainers
> +    ln -s ${WORKDIR}/runc ${S}/src/import/gobuild/go/src/github.com/opencontainers/runc
> +    export GOPATH="${S}/src/import/gobuild/go/src/github.com/opencontainers/runc"
>      oe_runmake
>  }
>  
> -- 
> 2.7.4
> 

> 


