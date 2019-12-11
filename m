Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.8412.1576091187307086031
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Dec 2019 11:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N8FboXV0;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: ticotimo@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D18B6E01206; Wed, 11 Dec 2019 11:06:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLY,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (ticotimo[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.166.176 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.0 FREEMAIL_REPLY From and body contain different freemails
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9205E011FF
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:06:25 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id f5so1939164ilq.5
        for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XQLLTY43wi/FxZadQ/3aM6aUlS6NChKTvbW+pWAGzUo=;
        b=N8FboXV0YTgXx5JAUpKdCDAxhAQjy5TtCQt3GgtDrftHuRI4iB7emUQ4v93x9FFluU
         WWcsu+Yapw/go8q8ioresH2avYH1ewjvoSMiNyWMdBYB0jAthzlxT21m5PU1K/48CGRl
         8Ga4gC68OPShtJBtYGpR3nQWq5Uwufvb3hG2CNKu361UGLOPbX6xR5gg6RfPlCMfN6H5
         Z7qg3azRpCgjjpAMwwRoimx9PDaakyl3DkdFQ4KLyZ3S+284FCwQZU58MeeFQdjJDVau
         cZTGD3Dn6/YSzJ+/gcZwA7K/5+92qUPnHaU/ILaM7g/Toj1/+BFfkJHuC8ROP2G6hGsY
         PVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XQLLTY43wi/FxZadQ/3aM6aUlS6NChKTvbW+pWAGzUo=;
        b=nAFhQ9TQL3E5CEfaFGQOqkjU2EqsLezZjBNfr7nOhwKppny87uv1yni8b8EFYX2Fv2
         ozaxspsWgJWvJDTRHIBmAyQZGHUFV8GTqy9xTP3lfN5sKknMhfYTP6VHMo5W3+wpDuTW
         CX64a3cooPZzvVfgmO5SsYQNgalmefXHa4BU3aLfh/rKSCUTTaLjTAwKYyhDawEF7Jpz
         OwUcw1i8V2kdY94Ec/PuOKbZdieFQzUnn2X0Pi9YqktXDmKZogxUIPIX1IcYTqSCgkQ5
         R04vq5uCRxwLSWNWMYtA6Jb2yQ6v8yilOEugF1hig57qH9ckAAUE8LTUSs/8/NodrQSF
         EN0Q==
X-Gm-Message-State: APjAAAVY3MCjhgLYQL7AwgPQbk4qEOHHRfWmbEmCHUuTLMnKA+U8UuW1
	36TLHkGvURKHsPmSP654bK27Hf0UIrv+Sh6pYBE=
X-Google-Smtp-Source: APXvYqz3DtvKKVV4CCUHQ7fEJ/lATEQvtgZV633YHYSfOj2hEFz0YMyrBnYLjc+J+YFPZuneuSR6Nu3qJffTUHXtJFU=
X-Received: by 2002:a92:1092:: with SMTP id 18mr4703008ilq.198.1576091184953;
 Wed, 11 Dec 2019 11:06:24 -0800 (PST)
MIME-Version: 1.0
References: <63726798-32ED-4DA0-A82B-8D753AAAB55E@linux.intel.com> <CADkTA4M4fqfZLy6YS_gLDAcd3mvtMYoOoKV6i2zr+xj7N1QfYw@mail.gmail.com>
In-Reply-To: <CADkTA4M4fqfZLy6YS_gLDAcd3mvtMYoOoKV6i2zr+xj7N1QfYw@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Wed, 11 Dec 2019 11:06:14 -0800
Message-ID: <CANx9H-Ahrs9nUY+WERZCaMQYoAVWG90Q+RMPzM4jT1dUBH9iqw@mail.gmail.com>
Subject: Re: [meta-virtualization] Hashicorp serf and go-crypto: which layer(s)?
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Tim Orling <timothy.t.orling@linux.intel.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000367f200599725352"

--000000000000367f200599725352
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 11:20 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Tue, Dec 10, 2019 at 9:18 PM Tim Orling
> <timothy.t.orling@linux.intel.com> wrote:
> >
> > I have a recipe for Hashicorp serf (latest release 0.8.5) which require=
s
> go-crypto. I=E2=80=99m currently planning to add go-crypto to meta-virtua=
lization,
> but serf makes sense next to consul in meta-cloud-services. Currently, th=
e
> README of m-c-s says its only layer dependency is oe-core.
> >
>
> heh. The m-c-s readme is wrong on that point ..
>
> > What is the consensus? Should I add recipes-devtools/go/go-crypto_git.b=
b
> to m-c-s and keep serf next to consul, or should I add
> recipes-connectivity/serf/hashicorp-serf_0.8.5.bb to meta-virtualizaton
> and keep go-crypto with the other go source only packages?
> >
>
> I'd say the 2nd option is the right one. Add serf along side consul,
> and go-crypto into meta-virt (and we can update the README for m-c-s
> along the way).
>

Turns out I missed upstream serf change. They are now =E2=80=9Cvendoring=E2=
=80=9D the part
of go-crypt that is needed. The dependency on external =E2=80=9Csource only=
=E2=80=9D
go-crypt is therefore eliminated. Much easier!


> > Also, devtool picked up all the licenses from vendor/, so I am adding a
> vendor-licenses.inc file to help keep the serf bb file shorter. Other
> recipes in meta-virtualization, such as kubernetes, would also have a lot
> of vendor code=E2=80=A6has anybody been concerned about licenses from ven=
dor/ ?
> >
>
> We've talked about this in the past, and yes, to be complete we really
> need the vendored licenses along with the main package license. So I
> think you are talking the right approach.
>

Great. Patch inbound shortly.

Thank you for the sounding board guidance.


> Bruce
>
> > Cheers,
> >
> > =E2=80=94Tim-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> >
> > View/Reply Online (#4858):
> https://lists.yoctoproject.org/g/meta-virtualization/message/4858
> > Mute This Topic: https://lists.yoctoproject.org/mt/68034443/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4874):
> https://lists.yoctoproject.org/g/meta-virtualization/message/4874
> Mute This Topic: https://lists.yoctoproject.org/mt/68034443/924729
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  =
[
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--000000000000367f200599725352
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Dec 10, 2019 at 11:20 PM Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Tue, Dec 10, 2019 at 9:18 PM T=
im Orling<br>
&lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">t=
imothy.t.orling@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I have a recipe for Hashicorp serf (latest release 0.8.5) which requir=
es go-crypto. I=E2=80=99m currently planning to add go-crypto to meta-virtu=
alization, but serf makes sense next to consul in meta-cloud-services. Curr=
ently, the README of m-c-s says its only layer dependency is oe-core.<br>
&gt;<br>
<br>
heh. The m-c-s readme is wrong on that point ..<br>
<br>
&gt; What is the consensus? Should I add recipes-devtools/go/<a href=3D"htt=
p://go-crypto_git.bb" rel=3D"noreferrer" target=3D"_blank">go-crypto_git.bb=
</a> to m-c-s and keep serf next to consul, or should I add recipes-connect=
ivity/serf/<a href=3D"http://hashicorp-serf_0.8.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">hashicorp-serf_0.8.5.bb</a> to meta-virtualizaton and keep =
go-crypto with the other go source only packages?<br>
&gt;<br>
<br>
I&#39;d say the 2nd option is the right one. Add serf along side consul,<br=
>
and go-crypto into meta-virt (and we can update the README for m-c-s<br>
along the way).<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Turns out I miss=
ed upstream serf change. They are now =E2=80=9Cvendoring=E2=80=9D the part =
of go-crypt that is needed. The dependency on external =E2=80=9Csource only=
=E2=80=9D go-crypt is therefore eliminated. Much easier!</div><div dir=3D"a=
uto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; Also, devtool picked up all the licenses from vendor/, so I am adding =
a vendor-licenses.inc file to help keep the serf bb file shorter. Other rec=
ipes in meta-virtualization, such as kubernetes, would also have a lot of v=
endor code=E2=80=A6has anybody been concerned about licenses from vendor/ ?=
<br>
&gt;<br>
<br>
We&#39;ve talked about this in the past, and yes, to be complete we really<=
br>
need the vendored licenses along with the main package license. So I<br>
think you are talking the right approach.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Great. Patch inb=
ound shortly.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you =
for the sounding board guidance.</div><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><br>
Bruce<br>
<br>
&gt; Cheers,<br>
&gt;<br>
&gt; =E2=80=94Tim-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt;<br>
&gt; View/Reply Online (#4858): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/4858" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/4858</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/68034443=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/68034443/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a>=C2=A0 [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
<br>
View/Reply Online (#4874): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/4874" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/4874</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/68034443/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
68034443/924729</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a>=C2=A0 [<a href=3D"mailto:ticotimo@gmail.c=
om" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
</blockquote></div></div>

--000000000000367f200599725352--
