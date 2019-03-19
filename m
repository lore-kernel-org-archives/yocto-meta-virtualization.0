Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D981FE00D07; Mon, 18 Mar 2019 20:37:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.180 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3700BE00C4D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Mar 2019 20:37:22 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id v22so10230404lje.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Mar 2019 20:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8dwB7CfPOeur0TnZf/7+zOPVqafPsOU2bgcxYiMkpBA=;
	b=YwztIaY567An0ccyrFCJZ5AiM7X142BM2/yxY840GV9DwF9ZCq5kOT1eEgdsoUcayV
	Z2bsPyYlhKsj4MaYmd3eK0/cz9GHhbM5qnV2iVvfLut8miFshx/TTMQIZdzyNummZUZP
	rczYrfsB8mdK7p2huLAdvni16EJjt+IC+lPAzVmRNIp+y2o413OuRIi94cMDX5r9iJDk
	6XMlfpb9nazX+t6mu+FKQWzcSp9thf2+G8a0yZPC/jPZG+x/AI6RFWwsfsEVTLLDblxI
	dEGlAWUU80Xy9w8nREYGcgg6mzhbqT6YgaCdTNcrg3OetHZRhaK3QW4KpJJiIuqQHYOq
	D3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8dwB7CfPOeur0TnZf/7+zOPVqafPsOU2bgcxYiMkpBA=;
	b=FsQ2XBeYrPX5gEFMgOlzppnCD4zcY+GCESrtNw7wvr6ruuQ6yYW5vI97EcvqJH0JAL
	Q5iBm/QtGDT7r0zL+UdWPzqxZH+Cto8qcK6hfWQutzmsoCbn+D2Fq/Yu3RgNCvWVNXul
	1LXn9vIkswKzc8DTmMJKj+0OE2RpNXG1qu8DkkCBkwe/o7ewQC0l5SCwT3GhpEPh7MEx
	CCrqlBU5Pjy/hqKlM67X0EfemsQXqF39HknR8bpCxaOrGaTgN/ies4qG+7xnbfG/vImC
	JlFGLrgLjeSIxZcfnDFjHMx6hXHHBOcEblHhIivPsKFVb5uaRAxoiJjQ78VmqFZfQpjn
	Wp7Q==
X-Gm-Message-State: APjAAAUcVyhrp547PdXLYplIMp79/pgLH/NbnI1P7drK8K+PqT1v9f/q
	TQpl1T23RNiHjDzqSfns1UkQWlr4nbxxm3QJt98=
X-Google-Smtp-Source: APXvYqyRZyDmxCffyeUuKw1M2gmI4hQuLlnloNkJadcJ+BhoLKj6PX1AVSZ5a/gwSao5NqXJm7/o7RliJVTWPyM2UBY=
X-Received: by 2002:a2e:408:: with SMTP id 8mr12525633lje.15.1552966641108;
	Mon, 18 Mar 2019 20:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <14216a2e-5d99-0a51-2f20-2deda907754d@windriver.com>
In-Reply-To: <14216a2e-5d99-0a51-2f20-2deda907754d@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Mar 2019 23:37:09 -0400
Message-ID: <CADkTA4PD94evvU==9hB0iJrkTtpnA9oZTqUfSb83Wrp7KxFx6w@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Help: consul do_compile failed after go upgrade to v1.12.
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
X-List-Received-Date: Tue, 19 Mar 2019 03:37:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2019 at 11:16 PM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> Hi Bruce,
>
> There is a failure on do_compile of consul under meta-cloud-services.
>
> This is introduced by go-1.12 which was upgraded several days ago.
>

Yep. I had also noticed this and reported it on the #overc freenode channel=
.
My hands are full with a few other issues, but I'm hoping to have a closer
look at it by the end of the week.

But if anyone else has a patch, I wouldn't object to it :D

Bruce

>
> But it can't be reproduced on my ubuntu-host, while only be reproduced on=
 Yocto.
>
> I try my best to fix it but has no result.
>
> So, I will be great appreciate for anyone's help.
>
>
> Thanks,
>
> Hongzhi
>
>
> There are some info about the failure:
>
>
> Error info:
>
> [
>
> # github.com/hashicorp/consul/connect/certgen
> type..eUfRrckI: missing section for relocation target type..FEeY9FdU
> type..eUfRrckI: reloc 8 (R_CALL) to non-elf symbol type..FEeY9FdU (outer=
=3Dtype..FEeY9FdU) 49 (SABIALIAS)
> # github.com/hashicorp/consul
> type..eUfRrckI: missing section for relocation target type..FEeY9FdU
> type..K6Uq9NPs: missing section for relocation target type..tBBUxeDj
>
> ]
>
> The above info come from go/src/cmd/link/internal/ld/data.go
>
>
> Commit ID from go upstream:
>
> 685aca45dc8435df7b7e8059a42a8a98efdaf22c
>
> cmd/compile, cmd/link: separate stable and internal ABIs
>
>
> Script: consul: run.do_compile
>
> The following command failed with -linkshared. It will pass if remove -li=
nkshared.
>
> x86_64-poky-linux-go install -linkshared -p 128 -v -ldflags=3D"-r /usr/li=
b/go/pkg/linux_amd64_dynlink  -extldflags ' -m64 -march=3Dcore2 -mtune=3Dco=
re2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/ala-lpggp2=
2/hsong/poky/build/tmp/work/core2-64-poky-linux/consul/git-r0/recipe-sysroo=
t -Wl,-rpath-link=3D/ala-lpggp22/hsong/poky/build/tmp/work/core2-64-poky-li=
nux/consul/git-r0/recipe-sysroot/usr/lib/go/pkg/linux_amd64_dynlink -Wl,-O1=
 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,rel=
ro,-z,now'" -buildmode=3Dpie `go_list_packages`
>
>
> [EOF]
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

