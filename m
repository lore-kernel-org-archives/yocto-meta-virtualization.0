Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01EDFE00B81; Mon, 25 Mar 2019 11:10:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.161.68 listed in list.dnswl.org]
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D666CE00942
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Mar 2019 11:10:21 -0700 (PDT)
Received: by mail-yw1-f68.google.com with SMTP id c4so7734002ywa.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Mar 2019 11:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Dvl1dHO6L5YdLKnMYX3j/J0ywLaY/XmLkgdYSvFeWR4=;
	b=Z6ZFE2Z1639r6KPhU2d8eV71uoS/nDoWYO8X760eao65mEClv0LLxuztV3bOquUIPq
	lEfE+KYF5qA1S5wlwnVxoKu8rAvAFBGQseAOG09wambfvZoCWcPpPGw2w9/1bpoE/a9p
	kaHunhDyCMKRkdylUsqnmvsnH2SgHk7RFR+2KJOL0fqDnuaz3rDvaXnytEeioCNFjGBM
	CVfCJke0feohJ742bmMKtZVAJeLIBKNr84P4gPqgVXqWKDRHc70879u0gDF221jnHwfY
	oFEPI4WMxRhVNa8VpbftemiKPBlUoIQzQ+W8Jev//rjhoQl230tICiZPuEGve/AtxLLD
	vkMA==
X-Gm-Message-State: APjAAAXOLcwaoxMlCW5aRiHEMhOyCSJs0sIZ8MoCVV7QXMwQLR6fcs5W
	8/rtASK5A4OYsdgG+ohqz7vMvwhFnRopMDlRBZA=
X-Google-Smtp-Source: APXvYqwWA36xlHO9MYmJE8NbQxln005ERKcnnsFmAVEDQQed3tJ9C0mf5gjCt8hdH4XMwrfMdAG+8gF5Gn/HWDKd9p4=
X-Received: by 2002:a25:cb42:: with SMTP id b63mr21381819ybg.75.1553537421057; 
	Mon, 25 Mar 2019 11:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <14216a2e-5d99-0a51-2f20-2deda907754d@windriver.com>
	<CADkTA4PD94evvU==9hB0iJrkTtpnA9oZTqUfSb83Wrp7KxFx6w@mail.gmail.com>
In-Reply-To: <CADkTA4PD94evvU==9hB0iJrkTtpnA9oZTqUfSb83Wrp7KxFx6w@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 25 Mar 2019 14:10:09 -0400
Message-ID: <CAPuovELqxcqwV8iezBiD9GAOeQe5cLUPMSGbMHuJdpeeTF9hTw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Help: consul do_compile failed after go upgrade to v1.12.
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
X-List-Received-Date: Mon, 25 Mar 2019 18:10:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2019 at 11:38 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Mon, Mar 18, 2019 at 11:16 PM Hongzhi, Song
> <hongzhi.song@windriver.com> wrote:
> >
> > Hi Bruce,
> >
> > There is a failure on do_compile of consul under meta-cloud-services.
> >
> > This is introduced by go-1.12 which was upgraded several days ago.
> >
>
> Yep. I had also noticed this and reported it on the #overc freenode chann=
el.
> My hands are full with a few other issues, but I'm hoping to have a close=
r
> look at it by the end of the week.
>
> But if anyone else has a patch, I wouldn't object to it :D

The issue is we are often overwriting GOROOT when we should not be.
Actually the go.bbclass is doing this when it should not be. This is
covered in detail here:
https://dave.cheney.net/2013/06/14/you-dont-need-to-set-goroot-really

As describe GOROOT is already properly set in our cross compiled go
tool and should not be overwritten. We can see this patch by doing the
equivalent of 'go env GOROOT' in a devshell (replacing go with the
full cross go toolname).

By overwriting GOROOT we are getting a mixmatch of std pkgs as well I
am not quite sure what tools are used as the GOROOT is used to define
two other paths:
$GOROOT/pkg/tool/$GOOS_$GOARCH and $GOROOT/pkg/$GOOS_$GOARCH
and $GOROOT/pkg/tool/$GOOS_$GOARCH simply doesn't exist.

I still need to do some investigation around this but I am able to
reproduce the issue and I am able to resolve the issue by not setting
GOROOT. Once I am satisfied with my findings I will send something
out, at this point it looks like a patch to oe-core's go.bbclass.

MarkA

>
> Bruce
>
> >
> > But it can't be reproduced on my ubuntu-host, while only be reproduced =
on Yocto.
> >
> > I try my best to fix it but has no result.
> >
> > So, I will be great appreciate for anyone's help.
> >
> >
> > Thanks,
> >
> > Hongzhi
> >
> >
> > There are some info about the failure:
> >
> >
> > Error info:
> >
> > [
> >
> > # github.com/hashicorp/consul/connect/certgen
> > type..eUfRrckI: missing section for relocation target type..FEeY9FdU
> > type..eUfRrckI: reloc 8 (R_CALL) to non-elf symbol type..FEeY9FdU (oute=
r=3Dtype..FEeY9FdU) 49 (SABIALIAS)
> > # github.com/hashicorp/consul
> > type..eUfRrckI: missing section for relocation target type..FEeY9FdU
> > type..K6Uq9NPs: missing section for relocation target type..tBBUxeDj
> >
> > ]
> >
> > The above info come from go/src/cmd/link/internal/ld/data.go
> >
> >
> > Commit ID from go upstream:
> >
> > 685aca45dc8435df7b7e8059a42a8a98efdaf22c
> >
> > cmd/compile, cmd/link: separate stable and internal ABIs
> >
> >
> > Script: consul: run.do_compile
> >
> > The following command failed with -linkshared. It will pass if remove -=
linkshared.
> >
> > x86_64-poky-linux-go install -linkshared -p 128 -v -ldflags=3D"-r /usr/=
lib/go/pkg/linux_amd64_dynlink  -extldflags ' -m64 -march=3Dcore2 -mtune=3D=
core2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2=
 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/ala-lpgg=
p22/hsong/poky/build/tmp/work/core2-64-poky-linux/consul/git-r0/recipe-sysr=
oot -Wl,-rpath-link=3D/ala-lpggp22/hsong/poky/build/tmp/work/core2-64-poky-=
linux/consul/git-r0/recipe-sysroot/usr/lib/go/pkg/linux_amd64_dynlink -Wl,-=
O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,r=
elro,-z,now'" -buildmode=3Dpie `go_list_packages`
> >
> >
> > [EOF]
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

