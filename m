Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 595FAE006B3; Mon, 20 Jun 2016 05:11:51 -0700 (PDT)
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
	*      [209.85.220.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC302E00474
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jun 2016 05:11:49 -0700 (PDT)
Received: by mail-qk0-f171.google.com with SMTP id p10so158451715qke.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jun 2016 05:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZxS+ygb9C7HT2hqxOS0d97Jb4UxcM6V1xKUpXp81UZo=;
	b=VxEBEi/22ex4LObXFS09wuCXvbdVv88/wlVuz/27w9HBsjOAIjVcS1tISKV10xmtII
	OY9Gk5+/13utbht8cP5z5tsc740c87pR2ONvpg6gbm0Sryx2B0luKc3tm/hCzE8t+3i0
	MPMlZApO9OKaxyvwixNTj27LKmOnmmPnzANKyU3z8Tel8Mpy6hBkiuwld2RDmT9GM93x
	UNaib7KGtnz3eT0fJF47e7111MCljMxwKcGdLa4k/gJc5DHCHUd/JdAXq+mhg9Ff56ye
	azlkEbuwfYhFq8ytKUq5pW/FPn5B1vBGKzF6aXZfuAeT0zT+zwGrSvUsg7ojdOjhP5lC
	oF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZxS+ygb9C7HT2hqxOS0d97Jb4UxcM6V1xKUpXp81UZo=;
	b=D+lbTs/dEO9yqc52XhjkUUyuXGO88EzhfwDu5iaFqECP0wO+VgzRCdaBWf4T9L3FIO
	/ynkU5/NnrdtqNxITyfmNOESb5zY1Z4urqufUU9Vhk10P89Yjr8UGLQxHAWL6ZH/UPI0
	m8j9jHHv27y181niFb3Paiu7v9JuP7OONnNtbvE1k2jXPHjf9Ax04bsBGrkExfQEH37u
	/I/m2jpgr5AtTxRaNPN/uDECOnlNoBH16qb1qsom/rO1cOSt0z8dv4KAOdU7WwO2KrYX
	kW6/h5gmyGoeJXun0K8Kvmup8yuewKCMIN+eXlavdEF/ZdUtDVoO3Ba6fhtze2MtNkQd
	joQg==
X-Gm-Message-State: ALyK8tKukeNGCQd6OmU7GH1IaPeDDynvL1nwHSZcJeA0B1thWoOIrJGvP/SsM+W775JAMnTcHAveBr2c2u3OuA==
X-Received: by 10.200.48.147 with SMTP id v19mr21723892qta.68.1466424709217;
	Mon, 20 Jun 2016 05:11:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Mon, 20 Jun 2016 05:11:48 -0700 (PDT)
In-Reply-To: <20160619095507.4c1f84cd@nuc.betafive.co.uk>
References: <20160619095507.4c1f84cd@nuc.betafive.co.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Jun 2016 08:11:48 -0400
Message-ID: <CADkTA4M38pcOVFatxRLpmCPn0OTc12uNCfChs0spzeYMMk0sXA@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Dependency on oe-meta-go
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
X-List-Received-Date: Mon, 20 Jun 2016 12:11:51 -0000
Content-Type: multipart/alternative; boundary=001a1143a83ee208ed0535b49bff

--001a1143a83ee208ed0535b49bff
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 19, 2016 at 4:55 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

> Hi all,
>
> The meta-virtualization README file says that one of the dependencies
> is:
>
>         URI: git://github.com/errordeveloper/oe-meta-go.git
>         branch: master
>         revision: HEAD
>
> However, that repository seems a bit out-of-date and I can build the
> software I'm using from meta-virtualization without using that layer.
>
> Is this still a valid dependency or does the README need an update?
>
>
It is still the goal that it is a valid dependency. We've have trouble
getting changes into
that layer (or in a timely fashion) .. so instead things have been flowing
into meta-virt.

But yes, you can build without it present due to the amount of changes
we've queued.

I'll keep that dependency around for a little bit longer, as a show of good
faith :D

Bruce


> Thanks,
> Paul Barker
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143a83ee208ed0535b49bff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Jun 19, 2016 at 4:55 AM, Paul Barker <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.u=
k</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi all,<br>
<br>
The meta-virtualization README file says that one of the dependencies<br>
is:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 URI: git://<a href=3D"http://github.com/errorde=
veloper/oe-meta-go.git" rel=3D"noreferrer" target=3D"_blank">github.com/err=
ordeveloper/oe-meta-go.git</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 branch: master<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 revision: HEAD<br>
<br>
However, that repository seems a bit out-of-date and I can build the<br>
software I&#39;m using from meta-virtualization without using that layer.<b=
r>
<br>
Is this still a valid dependency or does the README need an update?<br>
<br></blockquote><div><br></div><div>It is still the goal that it is a vali=
d dependency. We&#39;ve have trouble getting changes into</div><div>that la=
yer (or in a timely fashion) .. so instead things have been flowing into me=
ta-virt.</div><div><br></div><div>But yes, you can build without it present=
 due to the amount of changes we&#39;ve queued.</div><div><br></div><div>I&=
#39;ll keep that dependency around for a little bit longer, as a show of go=
od faith :D</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
Thanks,<br>
Paul Barker<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a1143a83ee208ed0535b49bff--
