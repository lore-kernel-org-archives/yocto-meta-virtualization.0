Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30B77E00CD5; Sun,  3 Jun 2018 20:27:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73399E00CC8
	for <meta-virtualization@yoctoproject.org>;
	Sun,  3 Jun 2018 20:27:53 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id v135-v6so22858980lfa.9
	for <meta-virtualization@yoctoproject.org>;
	Sun, 03 Jun 2018 20:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Wmcqb3GfdsPhbHd6gA+Q8rGHHYFdhvNc03Q9OJdvXjc=;
	b=B83X3i7TIbJYlqTxieisiaR/GQ/13lc+pukmyEITYFTDWOpxa7VoF+QNcrStZ+KqPc
	ZvMwFK+34Q3SAKPJ6VgkB7cvbGlzyQMqP2fLT5ekcbxvxxn3Q46YPaILVOtOCvGY7sDF
	iVo9SlCp/HNyDEfcLBg39FjjXGE0aQ0RAEWjg0bQN7WgXP1MaxIYWJ3CZX5FetRzKcrC
	eiNiCr5IGfKzjGsVXgyBixDHmToHpOjNEngOgSjiOgqPtUW53yE5PAohEbnHwwm4WVFB
	RZdKktK2V0HE05Pw19GOFvSSpcG0p62IWUwLVglwTcFi0Wmx/r3WSgIunuvvazIa/DIl
	4bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Wmcqb3GfdsPhbHd6gA+Q8rGHHYFdhvNc03Q9OJdvXjc=;
	b=pJzuO6xzi1ru1veME3mAjN0vkJ327jiuilo39ERwW3amVSXB0lW1pIFtSUKf1eqXYd
	BH/0yszzCUVXDb1WifBj1rQAamxZcwOMmAv61DKJ6qpSCh19pSF4xbXudxiLlnzU4usX
	jWrxRAwCw1+QCKy4AZqSfQlj7hGFlY4lI2zKVuHLZ8/vS64ZW+MPv/KvK1DJtXJgNIp4
	sOJIVQHB934rOO1Wc7EFKpzM2XJ81nelMsBAttc2EcI8l26FyW78RsK9XiZ1GvIKlG2D
	REAAdsmBA20K7y0z2QtEWk3FbMu9qveePvezP0s9eHDFKwH+QwRYc14LY4tZYi4Ls2pc
	LqWA==
X-Gm-Message-State: ALKqPwczilP4qCKA09aree3JJ6foDvbyWeNeppSfgI3eJcWEwnN5OVnv
	AT+UFEGKt4dXu8QNqttbsuQjRvCpAOl2H4V0Xew=
X-Google-Smtp-Source: ADUXVKLZYYq5/WutpDShsC57qOx06y7nxPRiCBJrA8T/R7a95Yj3v7PS+NwgY+vW6kqyzZp095Pq6eXy0ikVoruqHrs=
X-Received: by 2002:a19:a68a:: with SMTP id
	p132-v6mr11221810lfe.89.1528082872534; 
	Sun, 03 Jun 2018 20:27:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP;
	Sun, 3 Jun 2018 20:27:51 -0700 (PDT)
In-Reply-To: <1527800886-29777-1-git-send-email-mark.asselstine@windriver.com>
References: <1527800886-29777-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 3 Jun 2018 23:27:51 -0400
Message-ID: <CADkTA4PXchFAXW5jKqZTA8Qv81RYpPB3XV=B8CSLeC2pFAMc6w@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: meta-virtualization][PATCH 0/3] lxc: uprev to v3.0.0
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
X-List-Received-Date: Mon, 04 Jun 2018 03:27:54 -0000
Content-Type: multipart/alternative; boundary="000000000000ce0bec056dc884ec"

--000000000000ce0bec056dc884ec
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, May 31, 2018 at 5:08 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

>
> The following brings us up to date with the latest upstream release of
> lxc. Actually we get 3 things in this series.
> 1. an uprev to v3.0.0
> 2. working 'busybox' template (though I recommend you don't use it,
>    it is used for ptest but it is pretty useless otherwise).
> 3. updated ptest approach
>
> This will break meta-overc so I will follow up with one or more
> commits there which should be merged at the same time as this to avoid
> breaking OverC builds.
>
> Mark
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000ce0bec056dc884ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Thu, May 31, 2018 at 5:08 PM,=
 Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@wi=
ndriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
The following brings us up to date with the latest upstream release of<br>
lxc. Actually we get 3 things in this series.<br>
1. an uprev to v3.0.0<br>
2. working &#39;busybox&#39; template (though I recommend you don&#39;t use=
 it,<br>
=C2=A0 =C2=A0it is used for ptest but it is pretty useless otherwise).<br>
3. updated ptest approach<br>
<br>
This will break meta-overc so I will follow up with one or more<br>
commits there which should be merged at the same time as this to avoid<br>
breaking OverC builds.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--000000000000ce0bec056dc884ec--
