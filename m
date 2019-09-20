Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71B21E00D82; Thu, 19 Sep 2019 21:44:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA5B0E00B8E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Sep 2019 21:44:13 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id y127so4053613lfc.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Sep 2019 21:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k9BzrIXX4B2BscyRD+DZpQv/v6a++2n6r+g5wjH4Jv0=;
	b=PmWYuraQrLgTbKG1qS62yyXUP3yb/9Amu2I4CcQAG5CTyiQmRlnRMhXdwO+bp60g5U
	6AE6/5/h/VwFEJoDdIo68tQYgjfdBNafQTjHmet1YZIB156ZMsA2aKbdSv6aGnAByfko
	qaX00gXIhtYJXpPN/fPm6++THRzyQJdc/uU3Y691hv3fOePcNqR89nLy06zDABZrTmoD
	5PbQOGlx8MP/PWiRIYimJeLPqEXUb4I9GT4nCBjkbTFZIhdJzME6+JTYPRiUjo0Dskla
	nPQHhqENfzVEnog3GGbVHj9Ki2zNq2IBGSoCEZxd4YXmrZNccsjztErsRqyNmgzuKBlv
	k6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k9BzrIXX4B2BscyRD+DZpQv/v6a++2n6r+g5wjH4Jv0=;
	b=k3Ehr+gY0zb/EVj1uAqBhDooVjLnpdA9yEq4aQFOQm4koOGfeeqp5AsrDzhBWDnbAt
	sQIJpfP4GznWZ3iWelIsjATjLPOpZ/JVgBQMDzr75jGSfGJcaJSqwRZprghe0XpD77Z/
	KFLbS5Gtx0ZPnOVWw37Lr4W1jImfbsBNUMBibKJ4dnJDcGwxKd57ClDSpqjJFAhVWMo4
	a5VFUDwkszowse1ZdjZbVYsRz396NBsdi0WxGiVoO7h92frjWLFIF4C/cj6xkdtfVkln
	6Uq9kAyKFLfAffV9VEjIuJyKzaaRRg9QRw0osH3JF0V668x21lSOmXi7RbsR62LkyVbf
	K7Qw==
X-Gm-Message-State: APjAAAURhERWvkUCmJeQYYw08eBTVeeTKNfqTUIvBN/IM43l+Sxd+IhY
	3I3uakIqXluGGFkfo6s/4ZNiSYm2fIbwIfehcU6QyTCY
X-Google-Smtp-Source: APXvYqyGlx9F3bNmk/bsFaASs5ah2Ru/PHxSdSvirkq+bThMton4banIBCm1LZKAgVXMd2YoTculp69IG4J81/EGvq8=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr6935050lfn.177.1568954652569; 
	Thu, 19 Sep 2019 21:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190917134727.3174-1-joakimr@axis.com>
	<20190918175422.GB22136@gmail.com>
	<0fb556db-017c-5cf1-f7ab-b6ca4fd19d52@axis.com>
In-Reply-To: <0fb556db-017c-5cf1-f7ab-b6ca4fd19d52@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Sep 2019 00:44:01 -0400
Message-ID: <CADkTA4Pr2U1Br0FzrzhM1a=vUbQkeGi0H6ePL7OM5Mxfwk6STQ@mail.gmail.com>
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] templates/lxc-download.in: Use curl instead of wget
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
X-List-Received-Date: Fri, 20 Sep 2019 04:44:14 -0000
Content-Type: multipart/alternative; boundary="000000000000bc35120592f4b8cd"

--000000000000bc35120592f4b8cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 4:31 AM Joakim Roubert <joakim.roubert@axis.com>
wrote:

> On 2019-09-18 19:54, Bruce Ashfield wrote:
> >
> > merged
>
> Would it be possible to get this one backported/cherry-picked to the
> warrior branch?
>

This qualifies as something I'm willing to cherry pick .. so it is now on
warrior as well.

Bruce



>
> BR & TIA,
>
> /Joakim
> --
> Joakim Roubert
> Senior Engineer
>
> Axis Communications AB
> Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> Fax: +46 46 13 61 30, www.axis.com
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000bc35120592f4b8cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 19, 2019 at 4:31 AM Joakim Roubert &lt;=
<a href=3D"mailto:joakim.roubert@axis.com">joakim.roubert@axis.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2019-0=
9-18 19:54, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; merged<br>
<br>
Would it be possible to get this one backported/cherry-picked to the<br>
warrior branch?<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">This qualifies as something I&#39;m willing=
 to cherry pick .. so it is now on warrior as well.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
BR &amp; TIA,<br>
<br>
/Joakim<br>
-- <br>
Joakim Roubert<br>
Senior Engineer<br>
<br>
Axis Communications AB<br>
Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden<br>
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48<br>
Fax: +46 46 13 61 30, <a href=3D"http://www.axis.com" rel=3D"noreferrer" ta=
rget=3D"_blank">www.axis.com</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000bc35120592f4b8cd--
