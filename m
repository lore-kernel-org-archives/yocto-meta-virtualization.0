Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9376EE00D34; Thu,  4 Aug 2016 08:24:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBCE8E00A07
	for <meta-virtualization@yoctoproject.org>;
	Thu,  4 Aug 2016 08:24:41 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id j12so20451970ywb.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 04 Aug 2016 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iRw57YxneQWtG7nbvM7BqdSEYoCAV0DsiN/4wXo50+4=;
	b=d2J68YvLdeICyH4gMwfxv5DCePgVHGoTTAFXIslQJmdwQdf/ntzd1Kgx6nuDOSFP73
	4vid3EfTS3B2EVmHFF0vIBzEWgJ/iVqE9jerx66+hj4EGprDqx6EdvgGrLZadruCQL+T
	MayrczfYjuHnt3bzl6yeSyTrpe4FZr+4Bj3l65cFVjM4574HWIRqJenR6VZ5cYYxqD3/
	tBCwit0ljjSLdqjnlXiJ3FDl621JorPIx0/b/02ur/NpVllj4AlQaIiVrHnSEJfHIRpf
	3IbAl/0pQYnU6a/W6GKD9vSmjVAyqD4/ku0Zu3yYCPUjxvTN9GCid75SWrgAAICd6N8j
	2sEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=iRw57YxneQWtG7nbvM7BqdSEYoCAV0DsiN/4wXo50+4=;
	b=W0HGwSGODD5gDZQEhXgoM1AATOB9tLK4exnaSy3r1qAqSVW8EjwMOLFu4KIIw6p2qM
	H0pVqC7QyNZNl5jzuvjo2vhyeSqhjU5iOjwl3KvLxbUmd85OvcBV4i7h+hiUpfveHzkf
	C2JzTdKuNER76ByV/tZbOWMPFhgI0PfDx3PAEI4W42Xj/Y/o0vX9MfuZ4Et6g1mgb+cG
	Hv+oH2HXizm4IGI4bofwgx0eUjuApNfecfxowrXoYV4KgEqiDXKRa9G2FzCp6JnFvGG2
	wrEEGsAfOiMCW6h/M2OluwmhrWorSoB7q+KaqTG/ysQe1wORShuRknt06sbWrP35buGM
	bX8Q==
X-Gm-Message-State: AEkoouvCPlNXqJzlVqJhQ9qp5mR5bfcQWIRcEhakVh4UPfndE6APe/eo5BXgZAV7KeiCqAlKxVP+b70mzQiYYg==
X-Received: by 10.13.205.193 with SMTP id p184mr23384979ywd.264.1470324280476; 
	Thu, 04 Aug 2016 08:24:40 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.98.197 with HTTP; Thu, 4 Aug 2016 08:24:40 -0700 (PDT)
In-Reply-To: <477920ec-9e1b-1e2b-9368-92be651280bc@embed.me.uk>
References: <477920ec-9e1b-1e2b-9368-92be651280bc@embed.me.uk>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 4 Aug 2016 11:24:40 -0400
X-Google-Sender-Auth: N-LO4Yx3qEJ6NkOjxTectBrXshQ
Message-ID: <CAPuovEJPcYwX_dk+yzQoc1yMVWF3hmsqEGunCKnX8G1-WOX-sQ@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: go-distribution-digest failing
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
X-List-Received-Date: Thu, 04 Aug 2016 15:24:43 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 1, 2016 at 7:08 AM, Jack Mitchell <ml@embed.me.uk> wrote:
> Hi,
>
> Seems like its (weird) unpack method it uses is failing somehow. I have no
> understanding of why it's done like this and not just a normal git repo but
> this is the error I'm getting.
>
> DEBUG: Executing shell function do_install
> cp: cannot stat
> '/home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/git/*':
> No such file or directory
> WARNING:
> /home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/temp/run.do_install.3442:1
> exit 1 from 'cp -r
> /home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/git/*
> /home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/image/usr/local/go/src/github.com/docker/distribution/'
> ERROR: Function failed: do_install (log file is located at
> /home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/temp/log.do_install.3442)
>
> Anyone with insight into the unpack method any idea why it's failing?


The unpack is not failing, all of the above is do_install related.
Looking at the recipe history the unpack is manipulated to only leave
the digest part of the project (see commit
fe357d8c80137595ee6d0a84b9178f2f846ba441 [docker uprev 1.6.2]).

This being said my gut is agreeing with you that the issue is actually
in the do_unpackpost() in that the 'rm' is not functioning as
expected. The regex is setup to leave only 'digest' and 'LICENSE'
(note the rm regex leave uppercase 'L' and lowercase 'd' elements). If
the rm regex is misbehaving and removing all the contents then the
'cp' error you are seeing would be hit.

I would start by doing something very simple like:
mkdir /tmp/test
touch /tmp/test/blah
touch /tmp/test/digest
touch /tmp/test/LICENSE
rm -rf /tmp/test/[A-KM-Za-ce-z]*

Then I might  do 'bitbake go-distribution-digest -c devshell' which
will dump you in $S so you can inspect the directory, which I am
guessing is empty in your case. Then 'mkdir digest' and then rerun the
unpackpost using '../temp/run.do_unpackpost' and again inspect that
'digest' still exists.

This really feels like an issue with regex handling in the shell.

Mark



>
> Regards,
> Jack.
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

