Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1641FE00DC8; Tue,  5 Jul 2016 06:41:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCD26E00DC3
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jul 2016 06:41:49 -0700 (PDT)
Received: by mail-qt0-f170.google.com with SMTP id c34so100767453qte.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jul 2016 06:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hnCN46aSIutmUfvWzq+NFX8wiGKrk6+FolFy9tbYS5I=;
	b=hfKlXiIsxP9UeC2JVURDNtKTfc6SXSCueK9ulQaaviofHOSUocge7JCPWQxB4qWgTm
	0mBRYC0RL/gNPl46zQKRYZbB2S+ZiS2VZDARWEDxyQbci8RMgBmbR6anGk5GE/RAzPse
	MnSyghf8Bu6Llzb6dXR2vsnPp4c9YsuyqgocvnKnHyBZg27LdBjUnW2THFtW4HYA3ej/
	eFV8k977EQNQ4XZNDmH+sJdPMLIFqZ7Qau/h3EPnmT8Pyo/eGDiAQ8XJB01XVMJwE7Ia
	RIp/zGMKkj68sKCuL8bkKUYNrm1mpijg+8uF4tQrX5mr5es/MldatU0EStKvk12auYpM
	F8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hnCN46aSIutmUfvWzq+NFX8wiGKrk6+FolFy9tbYS5I=;
	b=C9owmk07u7maup4cf4eX2/1kW4MJBFKCefFboKXUYrlR9i1ICwInM8Mf5PUgXL4ylx
	3mMOEdfilPb4yaqh9MYAWgW7KWTO/MGOpDcrFPlYFQlPn4UDsxw/8dcfrNKXLESZmOPO
	ZIU1iKQgnl1+hejSNEQpAEIjXRCnLPXlYyE/1xjrleF5KlB0ap1anjI75kKjB5Lqe51V
	sTrteEOmWgOXCtkFtXjVnmdtHGfdyMT2I9WBIqOsYq0sKMbRGcxjPQLyPdBW/qXiXeEx
	jXP8yB235BKZueFuz9YR4q0VoVgYvAJV1IORywsrVVwApSIUTo8SH7kGrAbuZgRCyinu
	2i3Q==
X-Gm-Message-State: ALyK8tJxgTaV7qMN58DJT50I8SlraValaeoB1ZUpUJwzk5wTQytg76iYXy16nbs6E+AqCLWCjjdv8y0hqotXzQ==
X-Received: by 10.200.55.219 with SMTP id e27mr28110620qtc.93.1467726108865;
	Tue, 05 Jul 2016 06:41:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Tue, 5 Jul 2016 06:41:48 -0700 (PDT)
In-Reply-To: <62DD010A-DDDB-42AE-B1EF-1A8EBE7C73A8@gmail.com>
References: <E2C6389C-370A-4B0F-81EA-95D6F9F51BFE@gmail.com>
	<CADkTA4PBi1cT2QqVeWr39vB2Zvu2i=A4tD7QF=fBGC4LvPW93A@mail.gmail.com>
	<62DD010A-DDDB-42AE-B1EF-1A8EBE7C73A8@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Jul 2016 09:41:48 -0400
Message-ID: <CADkTA4O5WU18CEOzoxioQiYc89CaKjU8ZAwj1jnnQfcX5c-i+w@mail.gmail.com>
To: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: docker: error creating default bridge network: package not installed
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
X-List-Received-Date: Tue, 05 Jul 2016 13:41:54 -0000
Content-Type: multipart/alternative; boundary=001a114422e658b96c0536e39d0f

--001a114422e658b96c0536e39d0f
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 5, 2016 at 7:55 AM, Jean-Francois Dagenais <
jeff.dagenais@gmail.com> wrote:

> Hi Bruce,
>
> On Jul 4, 2016, at 00:30, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> I run the docker check scripts across linux-yocto* periodically, and my
> reports are
> clean. So there's could be something up with the mixing of the new docker
> and
> the older fido bbappend, or simply that 3.19 didn't get much love.
>
>
> Perhaps. But I was a part of my own failure. We use a local cloned
> linux-yocto
> tree (complete with meta) in which we have our own machine branches and
> meta
> branch. To override the repo url I had completely replaced ( = ) the
> SRC_URI
> variable in my linux-yocto_3.19.bbappend. This had the effect of removing
> the
> .scc's meta-virtualization was adding to the SRC_URI.
>
> What's the best way to remove items from a bitbake var? I only briefly
> looked for
> that... Is it through a python code fragment expansion? Or is there a more
> "bitbake-centric" way to do it?
>


Aha.

The SRC_URI can be manipulated like any other variable, so yes, you can
remove
items from it without needing to completely override it.

Checkout the _remove operator, here's Richard's post about it.

http://lists.openembedded.org/pipermail/bitbake-devel/2013-August/003751.html

.. but I admit that I failed to find a definitive reference in the oe or
bitbake manuals.

Bruce



>
> Anyway, thanks for the help!
> /jfd
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114422e658b96c0536e39d0f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jul 5, 2016 at 7:55 AM, Jean-Francois Dagenais <span dir=3D"ltr=
">&lt;<a href=3D"mailto:jeff.dagenais@gmail.com" target=3D"_blank">jeff.dag=
enais@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div style=3D"word-wrap:break-word">Hi Bruce,<div><span cla=
ss=3D""><br><div><blockquote type=3D"cite"><div>On Jul 4, 2016, at 00:30, B=
ruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_bl=
ank">bruce.ashfield@gmail.com</a>&gt; wrote:</div><br><div><div style=3D"fo=
nt-family:Helvetica;font-size:12px;font-style:normal;font-weight:normal;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px">I run the docker check scripts across lin=
ux-yocto* periodically, and my reports are</div><div style=3D"font-family:H=
elvetica;font-size:12px;font-style:normal;font-weight:normal;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px">clean. So there&#39;s could be something up with the=
 mixing of the new docker and</div><div style=3D"font-family:Helvetica;font=
-size:12px;font-style:normal;font-weight:normal;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px">the older fido bbappend, or simply that 3.19 didn&#39;t get much =
love.</div></div></blockquote><br></div></span><div><div>Perhaps. But I was=
 a part of my own failure. We use a local cloned linux-yocto</div><div>tree=
 (complete with meta) in which we have our own machine branches and meta</d=
iv><div>branch. To override the repo url I had completely replaced ( =3D ) =
the SRC_URI</div><div>variable in my linux-yocto_3.19.bbappend. This had th=
e effect of removing the</div><div>.scc&#39;s meta-virtualization was addin=
g to the SRC_URI.</div><div><br></div><div>What&#39;s the best way to remov=
e items from a bitbake var? I only briefly looked for</div><div>that... Is =
it through a python code fragment expansion? Or is there a more</div><div>&=
quot;bitbake-centric&quot; way to do it?</div></div></div></div></blockquot=
e><div><br><br></div><div>Aha.<br><br></div><div>The SRC_URI can be manipul=
ated like any other variable, so yes, you can remove<br></div><div>items fr=
om it without needing to completely override it.<br><br></div><div>Checkout=
 the _remove operator, here&#39;s Richard&#39;s post about it.<br><br><a hr=
ef=3D"http://lists.openembedded.org/pipermail/bitbake-devel/2013-August/003=
751.html">http://lists.openembedded.org/pipermail/bitbake-devel/2013-August=
/003751.html</a><br><br></div><div>.. but I admit that I failed to find a d=
efinitive reference in the oe or bitbake manuals.<br><br></div><div>Bruce<b=
r></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div style=3D"word-wrap:break-word"><div><div><div><br></div=
><div>Anyway, thanks for the help!</div><span class=3D""><font color=3D"#88=
8888"><div>/jfd</div></font></span></div></div></div></blockquote></div><br=
><br clear=3D"all"><br>-- <br><div class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a114422e658b96c0536e39d0f--
