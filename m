Return-Path: <tiniuc.alexandru@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 821E7E00A39; Thu, 24 Aug 2017 05:32:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (tiniuc.alexandru[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.53 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9856FE00726
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 05:32:36 -0700 (PDT)
Received: by mail-lf0-f53.google.com with SMTP id r2so2144031lff.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Z+eZi9bbYZUBUaRBLohlW0yiUnHNzao2ea540TEWnzU=;
	b=GNlh0gwcRmvqbq2Q9azRy0FIYby7BOgx/2BvAhOhC/w4zZvAuPWF6Wrxb76XPvYBo3
	wniuil5VAhPxgdgCx0R6067LJzap/g3NAMwwsTrCJZT7/7U+ViPIBXRjg070KlHTy4aU
	Mk982aTZPYDSBlVm7tn3B9dwV775zEJo0NjVbavDA90fXoR0TVJhTKctC8dMDiuH5ZqA
	iTGjVzAwTbBvfjXpctSTJzkfLKZcmtPJh6VPtTi1A5MIPvUoPwNaEYdOSy7SmQvjTE+g
	/aXiqJO+goR1QCtgthjmERRLbUaK8GkRM0sOLLI3Zd0Hjf0gAvkpHzGLoiIEPhgFoIAI
	KXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Z+eZi9bbYZUBUaRBLohlW0yiUnHNzao2ea540TEWnzU=;
	b=HT+q1iDzN7CCYlUkhnWWev8quygvu5pGsW2okSiAau1ww9C9FWkOmetxaoRavo5ymN
	x7IjJM39BQs9voSoINIu0b4EpIdaaYqNBxS1cXLb1B+YivLq10yCEi6z9wABGjKu8DYr
	dvcBF93YA7t7il8Lv9TrGSH/kHlyWLqaFhIlIdD+QW4FLaG9xxqjM0wUfvOi4+SUTB+o
	mHmRGKmZZ8Gyj53dShuM3JHEaOGiE1Fat8zuWpZtZ/wY8V82O4GWWpJpJvCAI46W49Ra
	G9bhU+B2khm74+uGkZ8/hpbH4pITS+N1tWBWrjedjDF9T5j8/04FjLZ16houMfzvtZG/
	Oj+g==
X-Gm-Message-State: AHYfb5giueXyeKjHXkS8RQEOV2+WLjdJiWh+Ro/D/oXk67Wb98JKF0de
	oqyBt0z2E0ECvN8TTs0o5I2dRcO40U5p/aM=
X-Received: by 10.25.242.68 with SMTP id d4mr1177626lfk.30.1503577955288; Thu,
	24 Aug 2017 05:32:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.5.81 with HTTP; Thu, 24 Aug 2017 05:32:34 -0700 (PDT)
In-Reply-To: <CANRoRsdz21DJS-_rsOcjWW1HtA2VZZLQDJnWjwASeMtrYaiS+A@mail.gmail.com>
References: <CANRoRsdz21DJS-_rsOcjWW1HtA2VZZLQDJnWjwASeMtrYaiS+A@mail.gmail.com>
From: Tiniuc Alexandru <tiniuc.alexandru@gmail.com>
Date: Thu, 24 Aug 2017 13:32:34 +0100
Message-ID: <CANRoRse9Up+Mc5O35_6jJEWEKFg-XpaAGamOFJe0VSbUvKiWLQ@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: [question] Sending a pull request
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
X-List-Received-Date: Thu, 24 Aug 2017 12:32:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c1cbe6aeacaf305577f05f6"

--94eb2c1cbe6aeacaf305577f05f6
Content-Type: text/plain; charset="UTF-8"

I have figured out what I was doing wrong with Git. I'm still not quite
sure how to make the create-pull-request script work. In case anyone else
stumbles into this: you need to configure git to use the GMail SMTP server.
I used this guide:
https://coderwall.com/p/dp-gka/setting-up-git-send-email-with-gmail , and I
generated an app password specifically for it, since storing your main
password in plaintext inside a config file is a Bad Thing.

I hope somebody will find this useful
Alexandru Tiniuc



On Thu, Aug 24, 2017 at 10:33 AM, Tiniuc Alexandru <
tiniuc.alexandru@gmail.com> wrote:

> I have been trying to send a pull request for a couple of days, and I have
> had little luck. The create-pull-request script fails and informs me that
> the remote URL seems incorrect (git://git.yoctoproject.org/
> meta-virtualization is the URL I am using.).
>
> Sending the patch directly using git send-email, as advised in the README
> file, doesn't seem to deliver the messages. My logfile mentions that the
> email was sent, but it hasn't appeared in the mailing list, nor in my inbox
> (I am automatically CC'd)
>
> Would you mind telling me what I am doing wrong? This is my first time
> using a terminal email client and I would be more than happy to learn how
> to do it properly.
>
> Many thanks,
> Alexandru Tiniuc
>

--94eb2c1cbe6aeacaf305577f05f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have figured out what I was doing wrong with Git. I&#39;=
m still not quite sure how to make the create-pull-request script work. In =
case anyone else stumbles into this: you need to configure git to use the G=
Mail SMTP server. I used this guide:=C2=A0<a href=3D"https://coderwall.com/=
p/dp-gka/setting-up-git-send-email-with-gmail">https://coderwall.com/p/dp-g=
ka/setting-up-git-send-email-with-gmail</a> , and I generated an app passwo=
rd specifically for it, since storing your main password in plaintext insid=
e a config file is a Bad Thing.<div><br></div><div>I hope somebody will fin=
d this useful</div><div>Alexandru Tiniuc<br><div><br></div><div><br></div><=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu=
, Aug 24, 2017 at 10:33 AM, Tiniuc Alexandru <span dir=3D"ltr">&lt;<a href=
=3D"mailto:tiniuc.alexandru@gmail.com" target=3D"_blank">tiniuc.alexandru@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">I have been trying to send a pull request for a couple of days, an=
d I have had little luck. The create-pull-request script fails and informs =
me that the remote URL seems incorrect (git://<a href=3D"http://git.yoctopr=
oject.org/meta-virtualization" target=3D"_blank">git.yoctoproject.org/<wbr>=
meta-virtualization</a> is the URL I am using.).=C2=A0<div><br></div><div>S=
ending the patch directly using git send-email, as advised in the README fi=
le, doesn&#39;t seem to deliver the messages. My logfile mentions that the =
email was sent, but it hasn&#39;t appeared in the mailing list, nor in my i=
nbox (I am automatically CC&#39;d)</div><div><br></div><div>Would you mind =
telling me what I am doing wrong? This is my first time using a terminal em=
ail client and I would be more than happy to learn how to do it properly.</=
div><div><br></div><div>Many thanks,</div><div>Alexandru Tiniuc</div></div>
</blockquote></div><br></div>

--94eb2c1cbe6aeacaf305577f05f6--
