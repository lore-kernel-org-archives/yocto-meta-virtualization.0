Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9FC6E00924; Mon, 10 Apr 2017 12:09:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.174 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.174 listed in dnsbl.sorbs.net]
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11E2EE0059A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Apr 2017 12:09:01 -0700 (PDT)
Received: by mail-yb0-f174.google.com with SMTP id m133so37637307ybb.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Apr 2017 12:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8JDrpfzQ1kh7EXY6QKcoUEPT6g6AmLcdJkH1vRw5u8k=;
	b=mwLb0AikRdkYgXpIqfGu9gmsFmAgrcmRH0f2Tn/bq/vyajvjSJDvqJ7J+uUFekTXD2
	pRB89MH3lewQuN9GBuQX+4FgwKuNjPLoVDoRqfeo+uKWBsttRUchyp6uSsqU0/5O3QWL
	fJ9MRNXZ2KuDLwLo88u+ZN6SvK6XKfg8YP9UB7GFiR8xnEOTdP25ZntT4fct+p+EQKwl
	RnBmn6+ly/4bmVK0XER+oZAPmrR74gpBwPIhd82C0J+34/KpEOfS1SRc2kuPK+8Uqs6A
	lS1V8ISJruD7G9lgCO7bzYDi26XgSbn2n43EyQGLfcncJ0RkbBNRZL0au9WYljJ2GjJP
	vaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=8JDrpfzQ1kh7EXY6QKcoUEPT6g6AmLcdJkH1vRw5u8k=;
	b=thpqfF3I2A6GiHbNMeFk4c3v62A6YwxLf3bRz2C5DSMH7PQfWOrNv3WBE3rjMrcyVr
	os3skmT/aVi82CqL6fC6ntD3TpSRPWpoALRAey+w1hNbFZ8Ekt/ueFRNmiX1pXYv/csc
	gqNOyJz6eNWljWBRduXtyPca7Wl0SZRbedGQQaDrA5whcm1+T9yC3R9QMDnzZlk9Aqx6
	IwDHgoGJKQKaI3lMTLvGXWVZRXO1WEkL5kqe4Pro0R9//GSpxZEX5DI8SMcTmkv7CPIt
	+J/OdrfodzGyFGzFsYTucrGq+QO62ESnobeJMv8ijPWoyWoXQISAggTBTheo3JQdenNH
	MKtg==
X-Gm-Message-State: AN3rC/5uyP1Ug6U43jm+eNW1XNyxT88X+vVHZAe8Tt1U04fA+dfsV3OCnNAh+T4EN+XlbM4JNskrpMdZqwVrVA==
X-Received: by 10.37.178.35 with SMTP id i35mr938932ybj.96.1491851340740; Mon,
	10 Apr 2017 12:09:00 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.56.88 with HTTP; Mon, 10 Apr 2017 12:09:00 -0700 (PDT)
In-Reply-To: <1491817865525.65707@mentor.com>
References: <1491817865525.65707@mentor.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 10 Apr 2017 15:09:00 -0400
X-Google-Sender-Auth: PM4YXtFnGl62FLTw9UjnroUe-u4
Message-ID: <CAPuovE+3a2OFr+4Dzo1Z4ox+S1tjEOw4Kkq4J_UTbyZm7L+SuQ@mail.gmail.com>
To: "Sheheryar, Muhammad" <Muhammad_Sheheryar@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Errors in building docker
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Apr 2017 19:09:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2017 at 5:51 AM, Sheheryar, Muhammad
<Muhammad_Sheheryar@mentor.com> wrote:
> Hi,
>
>
> I am trying to build docker in my yocto project (fido branch). I am
> encountering the following errors
>
>
> Log data follows:
> | DEBUG: Executing shell function do_compile
> |
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnue=
abi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/git
> | # WARNING! I don't seem to be running in the Docker container.
> | # The result of this command might be an incorrect build, and will not =
be
> | #   officially supported.
> | #
> | # Try this instead: make all
> | #
> |
> | bundles/1.5.0-dev already exists. Removing.
> |
> | ---> Making bundle: dynbinary (in bundles/1.5.0-dev/dynbinary)
> | Created binary:
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnue=
abi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/git/bundles=
/1.5.0-dev/dynbinary/dockerinit-1.5.0-dev
> | # code.google.com/p/gosqlite/sqlite3
> |
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/sysroots/x86_64-linux/usr/lib/libsqlit=
e3.so:
> file not recognized: File format not recognized

Have you run the 'file' command on this file to determine what it is
being seen as? Most likely an ARCH mismatch which you can then work
backwards from to determine what is creating this scenario.

Mark


> | collect2: error: ld returned 1 exit status
> | WARNING:
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnue=
abi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/temp/run.do=
_compile.32468:1
> exit 1 from
> |   DOCKER_GITCOMMIT=3D"2243e32cbbf1c9809c262a7376d34ca43a7a36dc"
> ./hack/make.sh dynbinary
> | ERROR: Function failed: do_compile (log file is located at
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnue=
abi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/temp/log.do=
_compile.32468)
>
>
> My instinct is that the errors are somehow related to go-sqlite package
> required for docker. The fetcher for the package fails as its previous
> repository has been shifted or removed. Can someone help me out?
>
>
> Regards,
>
>
> Muhammad Sheheryar
>
>
>
>
>
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

