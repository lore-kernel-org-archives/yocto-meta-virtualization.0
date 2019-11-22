Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2121.1574395169987925370
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2019 19:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Feiv5SiX;
 spf=softfail (domain: linuxfoundation.org, ip: 140.211.169.56, mailfrom: mhalstead@linuxfoundation.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3D34E00DD3; Thu, 21 Nov 2019 19:59:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.167.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78FB4E00DB7
	for <meta-virtualization@yoctoproject.org>; Thu, 21 Nov 2019 19:59:25 -0800 (PST)
Received: by mail-oi1-f193.google.com with SMTP id l20so5301003oie.10
        for <meta-virtualization@yoctoproject.org>; Thu, 21 Nov 2019 19:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=hcvC81YWgjuXt+P0IfeaGm9dWNS2TCqQywcpMQoBKOE=;
        b=Feiv5SiXHgB87Fpf1NC5JN+ENADXW7syv60Y0PDpxTqsRBmyoQe5cXNT1LgAFrvo2m
         oS/wsXs1k3oDwQfhU9TZW2Q5wNlURMdUZuPbDFUbdqnQF8eMhP4hvy51uheI2D4TfBKm
         sFbo5NR0h0pf1PZHSUsvklVU5idMPi7hUmWkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=hcvC81YWgjuXt+P0IfeaGm9dWNS2TCqQywcpMQoBKOE=;
        b=jVO3z5Pf7lVMdKWe7/+UXIpv+r2imGJYAHWywSl6FQHY58wW4L1lAIOnbJwCz36K3M
         GV7JByPUDyVlMt+Qezfnx2FQK4YECeQ5RqWa10LA06qT+K6l938dr3LXmTqiBE8lk0DC
         EVVXh/MP93sBbPLTlIPqATlnSO2j6sJx76GgEAk9yIs9gmgILgILGe9BlhhSg1PycQmZ
         +W7fQwMr/Ioiu63YYcswAO9m9OyVAbxy+zmw040BbspoGwv4trw7RGD07DhdScRG5nCe
         JZk4FcEw/rcCJFNOm83/vRQ8o25POnIYMCAynDSO9WwDvweZIc9+gK8zg+HBaiklpjev
         6FMQ==
X-Gm-Message-State: APjAAAX/s1Xx99MC17YvNDIJmFgRSN/MDoq2ffu5/yUv6kgLzBk+viUT
	nqdaBe2gXkOItiDfyAYh6qx32OyP8dsXo2rJbyIm7Q==
X-Google-Smtp-Source: APXvYqyVAoLxzgDLz1OHrR11lES+Cforv72RMdd6F84nONL9ttVklu1ExvH2sMaOSjxb4kRNzqCyDGNhpMOPo6PDyRo=
X-Received: by 2002:aca:f4c6:: with SMTP id s189mr10754541oih.63.1574395164541;
 Thu, 21 Nov 2019 19:59:24 -0800 (PST)
MIME-Version: 1.0
References: <e0299795-a076-faba-6cd2-1a6ccf295f76@linuxfoundation.org> <CADfgfoYzWFVsY_KhETe-vto0t7v-uHnKAkzuSoSRvekKtmovWQ@mail.gmail.com>
In-Reply-To: <CADfgfoYzWFVsY_KhETe-vto0t7v-uHnKAkzuSoSRvekKtmovWQ@mail.gmail.com>
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
Date: Thu, 21 Nov 2019 19:59:13 -0800
Message-ID: <CADfgfoZw57K2zbOXOGj1f0kU+3Nq4varmSatuNxrbxoo1+a9aA@mail.gmail.com>
Subject: Re: Mailing list platform change November 21st
To: automated-testing@yoctoproject.org, conferences@yoctoproject.org, 
	eclipse-yocto@yoctoproject.org, linux-yocto@yoctoproject.org, 
	meta-amd@yoctoproject.org, meta-freescale@yoctoproject.org, 
	meta-intel@yoctoproject.org, meta-lsi@yoctoproject.org, 
	meta-mentor@yoctoproject.org, meta-ti@yoctoproject.org, 
	meta-virtualization@yoctoproject.org, meta-xilinx@yoctoproject.org, 
	poky@yoctoproject.org, toaster@yoctoproject.org, 
	Yocto Project Discussion <yocto@yoctoproject.org>, yocto-ab@yoctoproject.org, 
	yocto-advocacy@yoctoproject.org, yocto-announce@yoctoproject.org, 
	yocto-bsp@yoctoproject.org, yocto-infrastructure@yoctoproject.org, 
	yocto-security@yoctoproject.org, 
	Discuss website content updates <yocto-website@yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000084dbd60597e770b4"

--00000000000084dbd60597e770b4
Content-Type: text/plain; charset="UTF-8"

The migration is complete. Please update your address books to point to the
new list e-mail addresses. There are rewrites in place so the previous
mailing list addresses will continue to work for a limited time. I am
sending this message to the old addresses to test that functionality. In
the next few days we will have redirects for the old pipermail archives to
keep links working. We are also in the process of setting up
https://public-inbox.org/README.html for users who would like to retrieve
list mail using git. Lists and archives are currently accessible via the
links at https://www.yoctoproject.org/community/mailing-lists/.

If you are currently a member of any list your account is already created.
Visit https://lists.yoctoproject.org/sendloginlink and enter the e-mail you
receive list mail at to receive a login link and set a password.

If you have questions please visit
https://wiki.yoctoproject.org/wiki/index.php?title=GroupsMigration to see
if they have been answered. E-mail pointofcontact@lists.yoctoproject.org
with new questions.

--
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer


On Wed, Nov 20, 2019 at 11:23 PM Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> The window for the mailing list move has shifted forward to November 21st
> from 4pm to 8pm Pacific Standard Time. (2019-11-22 00:00-04:00 UTC)
>
> Moderators please tend to all pending requests today.
>
> Thank you,
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>
> On Fri, Nov 15, 2019 at 4:25 PM Michael Halstead <
> mhalstead@linuxfoundation.org> wrote:
>
>> After backing out of the first attempt to migrate we are again moving
>> our lists from Mailman to Groups.io. E-mail to lists will be delayed
>> during the move window on November 21st between 17:00 and 23:00 UTC.
>>
>> A new account will be created for you on the Groups.io platform and most
>> users will only need to update their list mailing address from the
>> @yoctoproject.org to @lists.yoctoproject.org.
>>
>> Moderators please attend to all pending requests next Wednesday November
>> 20th.
>>
>> Please read more about the change on the wiki:
>>
>> https://wiki.yoctoproject.org/wiki/index.php?title=GroupsMigration
>>
>> If there are serious issues we will rollback the changes. We will e-mail
>> all lists when work is complete.
>>
>> --
>> Michael Halstead
>> Linux Foundation / Yocto Project
>> Systems Operations Engineer
>>
>

--00000000000084dbd60597e770b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The migration is complete. Please update your address book=
s to point to the new list e-mail addresses. There are rewrites in place so=
 the previous mailing list addresses will continue to work for a limited ti=
me. I am sending this message to the old addresses to test that functionali=
ty. In the next few days we will have redirects for the old pipermail archi=
ves to keep links working. We are also in the process of setting up <a href=
=3D"https://public-inbox.org/README.html">https://public-inbox.org/README.h=
tml</a> for users who would like to retrieve list mail using git. Lists and=
 archives are currently accessible via the links at <a href=3D"https://www.=
yoctoproject.org/community/mailing-lists/">https://www.yoctoproject.org/com=
munity/mailing-lists/</a>.<br><br>If you are currently a member of any list=
 your account is already created. Visit=C2=A0<a href=3D"https://lists.yocto=
project.org/sendloginlink">https://lists.yoctoproject.org/sendloginlink</a>=
=C2=A0and enter the e-mail you receive list mail at to receive a login link=
 and set a password.<br><br>If you have questions please visit <a href=3D"h=
ttps://wiki.yoctoproject.org/wiki/index.php?title=3DGroupsMigration">https:=
//wiki.yoctoproject.org/wiki/index.php?title=3DGroupsMigration</a> to see i=
f they have been answered. E-mail <a href=3D"mailto:pointofcontact@lists.yo=
ctoproject.org">pointofcontact@lists.yoctoproject.org</a> with new question=
s.<div><br></div><div>--<br>Michael Halstead<br>Linux Foundation / Yocto Pr=
oject<br>Systems Operations Engineer<br></div><div><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 20=
, 2019 at 11:23 PM Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxfo=
undation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">The window for the mailing list move has shifted forward to November 21s=
t from 4pm to 8pm Pacific Standard Time. (2019-11-22 00:00-04:00 UTC)<div><=
br></div><div>Moderators please tend to all pending requests today.</div><d=
iv><br></div><div>Thank you,</div><div>--<br>Michael Halstead<br>Linux Foun=
dation / Yocto Project<br>Systems Operations Engineer<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov =
15, 2019 at 4:25 PM Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxf=
oundation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">After backing=
 out of the first attempt to migrate we are again moving<br>
our lists from Mailman to Groups.io. E-mail to lists will be delayed<br>
during the move window on November 21st between 17:00 and 23:00 UTC.<br>
<br>
A new account will be created for you on the Groups.io platform and most<br=
>
users will only need to update their list mailing address from the<br>
@<a href=3D"http://yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">y=
octoproject.org</a> to @<a href=3D"http://lists.yoctoproject.org" rel=3D"no=
referrer" target=3D"_blank">lists.yoctoproject.org</a>.<br>
<br>
Moderators please attend to all pending requests next Wednesday November<br=
>
20th.<br>
<br>
Please read more about the change on the wiki:<br>
<br>
<a href=3D"https://wiki.yoctoproject.org/wiki/index.php?title=3DGroupsMigra=
tion" rel=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wi=
ki/index.php?title=3DGroupsMigration</a><br>
<br>
If there are serious issues we will rollback the changes. We will e-mail<br=
>
all lists when work is complete.<br>
<br>
-- <br>
Michael Halstead<br>
Linux Foundation / Yocto Project<br>
Systems Operations Engineer<br>
</blockquote></div>
</blockquote></div>

--00000000000084dbd60597e770b4--
