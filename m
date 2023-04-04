Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE850C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 12:43:31 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.100301.1680612206424398406
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 05:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jFT9wvCb;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id h187so12562353iof.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Apr 2023 05:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680612205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YA4mCub4bwwL1xekk/LRwraKOxf0oujxABzKOokEXs=;
        b=jFT9wvCbr7rNNd4Z05ZorJiYtaM1s2LtXH0g/De6Bo41WO6obrTjlws0ceSf89N+Co
         lwEOmA6A+dtump9LV30iXKsgVKviVlZ04tNyUaD299JoVEG5RjNy5Ne9zR5RNsZ7TYev
         A0NBo71X4MUVjMETQOFwQVfKOhjsrjypMHcC/7Vof9I7D8vlFD+Aop+Z/fX290j4GcCZ
         MQkSLx+uFL5U67oGq3eWOS1mCl7dZHbcmj76BV/G/HC0RmIOe/c7Rz0TdO53nIyk2zNJ
         t/G2E0cPOcQi9BR8gyzGV2guflEa7YRYrE6cnHCFn7eXeOIk9DNmba3GzCBc5zwQPq9h
         HH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680612205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YA4mCub4bwwL1xekk/LRwraKOxf0oujxABzKOokEXs=;
        b=yg3Q5aVxSSuteKzzp0rgz2kklhC+q5w0ahzd4bozRVxoLTlAS6orGQm6h943BIC/TI
         K9fKxVxOGfX/NLBzNAG5OFx2cTtqIUNO1WB6bcMOuVoP5zB4z605cpjkOOIKDwQxTQGM
         eJBLjMXm19cd+Lu06wO3j5JiSVXdL6TupXgbu1L1WIhkmjhcNJXaOig2hM4dl9FNEsLG
         tmaXLd2QKwQJQMWL0cL4r8DUuxXoXnIdZ1nflqO9/Y+6+x7E9SrKzBTimnG1mLZoiYCz
         GHQgnH1WlKo0g0FD262qlUA3w+/iTecMCa7h3o/WFo21by6mAFQShIfi2cF1y4vDPReS
         t+Og==
X-Gm-Message-State: AAQBX9fuQ8ZkBCOHtCn1GymGkEiZuCw7bWG/OSEDv8ksmYQQ+YRMktpk
	E9WqrRuy6QoZTY4ltQG12eaETkNBokwKJVCGc1w=
X-Google-Smtp-Source: AKy350YfLUOdxERdpyqd4HnHJvIdURKVEaleYIm5Npgx1lexHEjE/3so45m7Yec/pOKEl+o/+ZJj6zes6v57HGYUitk=
X-Received: by 2002:a6b:7b02:0:b0:744:d7fc:7a4f with SMTP id
 l2-20020a6b7b02000000b00744d7fc7a4fmr1484364iop.1.1680612205262; Tue, 04 Apr
 2023 05:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <DB6PR03MB2901D4439A5131E632CC350791939@DB6PR03MB2901.eurprd03.prod.outlook.com>
In-Reply-To: <DB6PR03MB2901D4439A5131E632CC350791939@DB6PR03MB2901.eurprd03.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Apr 2023 08:43:14 -0400
Message-ID: <CADkTA4OoUsRawN_f_4pQo=Z7jv3ZMkuhjKHR1Wr+qaT5mb2GHQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Deploying container images directly into
 the target rootfs at build time
To: Adrian Dudau <adrian.dudau@keyfactor.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/related; boundary="00000000000081b23905f882052b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Apr 2023 12:43:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7981

--00000000000081b23905f882052b
Content-Type: multipart/alternative; boundary="00000000000081b23705f882052a"

--00000000000081b23705f882052a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 3:36=E2=80=AFAM Adrian Dudau <adrian.dudau@keyfactor=
.com>
wrote:

> Hello,
>
> We have a situation where we have a number of pre-built containers in a
> repository that I would like to get into the target image at runtime. I
> want to avoid having to pull them with Podman at runtime and am also
> trying to avoid having to rebuild them with Yocto.
>
>
There are several presentations floating around (and at least one that I
did) talking about the pros and cons of the different approaches. One way
to summarize the options is: there are a lot of different ways to do what
you are describing, but most only work for non-production systems (and are
usually not upstreamable solutions) due to things like root requirements,
licensing, SBOM, artifacts, binary package feeds, etc.



> My approach so far has been to try and do podman pull and build a local
> store at build time using bitbake and then have the whole store installed
> into the rootfs. But I hit a bug with with using sudo in bitbake and Bruc=
e
> suggested that this might not even be the best approach, so I came here
> asking for other suggestions.
>

As I had mentioned in the other OE core thread, I spent about a month in
this development cycle working on various options to get a framework into
meta-virt to accomplish this task.

It isn't ready yet, as I am completing the package upgrades for the
release, and had to do the 6.1 and 6.3 kernels for the release .. but I
will be picking it back up again in the upcoming weeks and would at least
have some broken code to share, and see if anyone wants to lend a hand.

What I'm establishing right now (for the container part), are some base
container  images and multi-lib definitions, that allow containers to be
built and either directly installed to a container backing store or via
sometime like podman load to read and install the container to their
specific root/container store.

The tricky bits are disassembling what the cli's do, and finding the
underlying manipulation libraries. By working directly with them (which
would preferably have been oci-* tools by now) , I'm locating where we need
elevated permissions and mapping them to something pseudo can support.
podman tries to manipulate namespaces, etc, even on a load -> save cycle,
when really, it doesn't need to .. since we aren't actually running the
containers.

I ran out of time knee deep into the internals of everything from pseudo,
sudo and the various container libraries.

And yes, I did see many things that you've also been seeing with sudo, and
didn't get to the bottom of it yet, but it wasn't my focus so I put it into
the "pickup later" bucket.

If anyone reading my description above has dug into the namespaces or sudo
issues, I'm sure we'd all love to hear from you!

Cheers,

Bruce



>
> Best regards,
> --Adrian
>
>
>
> *Adrian Dudau*
>
> Senior Software Engineer
>
> *M: **+46 709 714 069*
>
> adrian.dudau@*keyfactor.com <https://www.keyfactor.com/>*
>
>
>
> *Seamless orchestration. **Every key, every certificate.*
>
> Follow Keyfactor on *LinkedIn*
>
> *PrimeKey and Keyfactor merged
> <https://www.keyfactor.com/press-releases/keyfactor-and-primekey-merge-to=
-bring-machine-identity-management-to-the-mainstream/>*
> in June 2021. Moving forward, communication will come from Keyfactor. *Pr=
imeKey.com
> <https://www.primekey.com/>* will be live throughout 2022.
>
>
> CONFIDENTIALITY NOTICE
>
> This communication may contain privileged or other confidential
> information. If you received this email in error, then please advise the
> sender by reply email and immediately delete the message and any
> attachments without copying or disclosing the contents. Thank you.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7980):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7980
> Mute This Topic: https://lists.yoctoproject.org/mt/98055400/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000081b23705f882052a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Apr 4, 2023 at 3:36=E2=80=AFAM Adrian Dudau=
 &lt;<a href=3D"mailto:adrian.dudau@keyfactor.com">adrian.dudau@keyfactor.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div class=3D"msg-8129218712468569919">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Hello,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
We have a situation where we have a number of pre-built containers in a rep=
ository that I would like to get into the target image at runtime. I want t=
o avoid having to pull them with Podman at runtime and am also trying=C2=A0=
to avoid having to rebuild them with
 Yocto.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">There are several presentations floating=
 around (and at least one that I did) talking about the pros and cons of th=
e different approaches. One way to summarize the options is: there are a lo=
t of different ways to do what you are describing, but most only work for n=
on-production systems (and are usually not upstreamable solutions) due to t=
hings like root requirements, licensing, SBOM, artifacts, binary package fe=
eds, etc.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div class=3D"msg-8129218712468569919"><div dir=3D"ltr"><d=
iv style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;c=
olor:rgb(0,0,0);background-color:rgb(255,255,255)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
My approach so far has been to try and do podman pull and build a local sto=
re at build time using bitbake and then have the whole store installed into=
 the rootfs. But I hit a bug with with using sudo in bitbake and Bruce sugg=
ested that this might not even be
 the best approach, so I came here asking for other suggestions.</div></div=
></div></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">As I had mentioned in the other OE core thread, I spen=
t about a month in this development cycle working on various options to get=
 a framework into meta-virt to accomplish this task.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">It isn&#39;t ready yet, as I am completing the =
package upgrades for the release, and had to do the 6.1 and 6.3 kernels for=
 the release .. but I will be picking it back up again in the upcoming week=
s and would at least have some broken code to share, and see if anyone want=
s to lend a hand.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">What I&=
#39;m establishing=C2=A0right now (for the container part), are some base c=
ontainer=C2=A0 images and multi-lib definitions, that allow containers to b=
e built and either directly installed to a container backing store or via s=
ometime like podman load to read and install the container to their specifi=
c root/container store.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">T=
he tricky bits are disassembling=C2=A0what the cli&#39;s do, and finding th=
e underlying manipulation=C2=A0libraries. By working directly with them (wh=
ich would preferably=C2=A0have been oci-* tools by now) , I&#39;m locating =
where we need elevated permissions and mapping them to something pseudo=C2=
=A0can support. podman tries to manipulate namespaces, etc, even on a load =
-&gt; save cycle, when really, it doesn&#39;t need to .. since we aren&#39;=
t actually running the containers.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I ran out of time knee deep into the internals of everything fro=
m pseudo, sudo and the various container libraries.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">And yes, I did see many things that you&#39;ve a=
lso been seeing with sudo, and didn&#39;t get to the bottom of it yet, but =
it wasn&#39;t my focus so I put it into the &quot;pickup later&quot; bucket=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">If anyone reading my de=
scription above has dug into the namespaces or sudo issues, I&#39;m sure we=
&#39;d all love to hear from you!</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Cheers,</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div class=3D"msg-8129218712468569919"><div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Best regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
--Adrian<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_-8129218712468569919Signature">
<div>
<p style=3D"margin-bottom:0.06in;line-height:100%;background:transparent;fo=
nt-family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:0.11in" =
lang=3D"en-SE">
<a></a><font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt"=
 size=3D"3"><font style=3D"color:rgb(42,25,102)"><font face=3D"Arial, serif=
"><font style=3D"font-size:10pt" size=3D"2"><span style=3D"letter-spacing:0=
.5pt"><b>Adrian Dudau</b></span></font></font></font></font></font></p>
<p style=3D"margin-bottom:0in;line-height:100%;background:transparent;font-=
family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:0.05in" lan=
g=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color:rgb(138,138,138)"><font face=3D"Arial, serif"><=
font style=3D"font-size:10pt" size=3D"2">Senior Software Engineer</font></f=
ont></font></font></font></p>
<div style=3D"margin-bottom:0px;line-height:0.29in;background:transparent;f=
ont-family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:13.3333=
px" lang=3D"en-SE">
<img style=3D"width: 28px; height: 3px; max-width: initial;" width=3D"28" h=
eight=3D"3" src=3D"cid:1874c411429d2576e481"></div>
<p style=3D"margin-bottom:0in;line-height:100%;background:transparent;font-=
family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:0.05in" lan=
g=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color:rgb(42,25,102)"><font face=3D"Arial, serif"><fo=
nt style=3D"font-size:10pt" size=3D"2"><span style=3D"letter-spacing:0.3pt"=
><b>M:
</b></span></font></font></font><font style=3D"color:rgb(138,138,138)"><fon=
t face=3D"Arial, serif"><font style=3D"font-size:10pt" size=3D"2"><span sty=
le=3D"letter-spacing:0.3pt"><b>+46 709 714 069</b></span></font></font></fo=
nt></font></font></p>
<p style=3D"margin-bottom:0in;line-height:100%;background:transparent;font-=
family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:0.05in" lan=
g=3D"en-SE">
<a></a><font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt"=
 size=3D"3"><font style=3D"color:rgb(138,138,138)"><font face=3D"Arial, ser=
if"><font style=3D"font-size:10pt" size=3D"2">adrian.dudau</font></font></f=
ont><font style=3D"color:rgb(138,138,138)"><font face=3D"Arial, serif"><fon=
t style=3D"font-size:10pt" size=3D"2">@</font></font></font><font style=3D"=
color:rgb(40,185,5)"><u><a href=3D"https://www.keyfactor.com/" target=3D"_b=
lank"><font style=3D"color:rgb(42,25,102)"><font face=3D"Arial, serif"><fon=
t style=3D"font-size:10pt" size=3D"2">keyfactor.com</font></font></font></a=
></u></font></font></font></p>
<p style=3D"margin-bottom:0in;line-height:100%;background:transparent;font-=
family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:0.05in" lan=
g=3D"en-SE">
<br>
</p>
<div style=3D"margin-bottom:0px;line-height:100%;background:transparent;fon=
t-family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:4.8px" la=
ng=3D"en-SE">
<img style=3D"width: 165.69px; height: 31px; max-width: initial;" width=3D"=
165" height=3D"31" src=3D"cid:1874c411429caa7ff522"><br>
</div>
<p style=3D"margin-bottom:0.17in;line-height:200%;background:transparent;fo=
nt-family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:0.08in" =
lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color:rgb(42,25,102)"><font face=3D"Arial, serif"><fo=
nt style=3D"font-size:10pt" size=3D"2"><i>Seamless orchestration.
</i></font></font></font><font style=3D"color:rgb(42,25,102)"><font face=3D=
"Arial, serif"><font style=3D"font-size:10pt" size=3D"2"><i><b>Every key, e=
very certificate.</b></i></font></font></font></font></font></p>
<p style=3D"margin-bottom:0in;line-height:200%;background:transparent;font-=
family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:0.05in" lan=
g=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color:rgb(138,138,138)"><font face=3D"Arial, serif"><=
font style=3D"font-size:10pt" size=3D"2">Follow Keyfactor on
</font></font></font><font style=3D"color:rgb(40,185,5)"><u><font style=3D"=
color:rgb(42,25,102)"><font face=3D"Arial, serif"><font style=3D"font-size:=
10pt" size=3D"2"><span lang=3D"en-US">LinkedIn</span></font></font></font><=
/u></font></font></font></p>
<p style=3D"margin-bottom:0in;line-height:100%;background:transparent;font-=
family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:0.05in" lan=
g=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color:rgb(40,185,5)"><u><a href=3D"https://www.keyfac=
tor.com/press-releases/keyfactor-and-primekey-merge-to-bring-machine-identi=
ty-management-to-the-mainstream/" target=3D"_blank"><font style=3D"color:rg=
b(42,25,102)"><font face=3D"Arial, serif"><font style=3D"font-size:10pt" si=
ze=3D"2">PrimeKey
 and Keyfactor merged</font></font></font></a></u></font><font face=3D"Aria=
l, serif"><font style=3D"font-size:10pt" size=3D"2"></font></font><font sty=
le=3D"color:rgb(138,138,138)"><font face=3D"Arial, serif"><font style=3D"fo=
nt-size:10pt" size=3D"2"> in June 2021. Moving
 forward, communication will come from Keyfactor. </font></font></font><fon=
t style=3D"color:rgb(40,185,5)"><u><a href=3D"https://www.primekey.com/" ta=
rget=3D"_blank"><font style=3D"color:rgb(42,25,102)"><font face=3D"Arial, s=
erif"><font style=3D"font-size:10pt" size=3D"2">PrimeKey.com</font></font><=
/font></a></u></font><font style=3D"color:rgb(60,60,60)"><font face=3D"Aria=
l, serif"><font style=3D"font-size:10pt" size=3D"2"></font></font></font><f=
ont style=3D"color:rgb(138,138,138)"><font face=3D"Arial, serif"><font styl=
e=3D"font-size:10pt" size=3D"2">
 will be live throughout 2022.</font></font></font><font style=3D"color:rgb=
(60,60,60)"><font face=3D"Arial, serif"><font style=3D"font-size:10pt" size=
=3D"2">
</font></font></font></font></font></p>
<p style=3D"margin-bottom:0in;line-height:100%;background:transparent;font-=
family:Arial,serif;font-size:10pt;font-weight:normal;margin-top:0.05in" lan=
g=3D"en-SE">
<br>
</p>
<p style=3D"margin-bottom:0in;line-height:0.19in;background:transparent;fon=
t-family:Arial,serif;font-size:10pt;font-weight:normal" lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color:rgb(138,138,138)"><font face=3D"Arial, serif"><=
font style=3D"font-size:10pt" size=3D"2"><span lang=3D"fr-FR">CONFIDENTIALI=
TY NOTICE</span></font></font></font></font></font></p>
<p style=3D"margin-bottom:0in;line-height:0.19in;background:transparent;fon=
t-family:Arial,serif;font-size:10pt;font-weight:normal" lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color:rgb(138,138,138)"><font face=3D"Arial, serif"><=
font style=3D"font-size:10pt" size=3D"2"><span lang=3D"fr-FR">This communic=
ation may contain privileged or other confidential
 information. If you received this email in error, then please advise the s=
ender by reply email and immediately delete the message and any attachments=
 without copying or disclosing the contents. Thank you.</span></font></font=
></font></font></font></p>
</div>
</div>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7980): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7980" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7980</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/98055400/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/98055400/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re">- Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II=
<br><br></div></div>

--00000000000081b23705f882052a--

--00000000000081b23905f882052b
Content-Type: image/png; name="Outlook-l2wtk0n3.png"
Content-Disposition: inline; filename="Outlook-l2wtk0n3.png"
Content-Transfer-Encoding: base64
Content-ID: <1874c411429d2576e481>
X-Attachment-Id: 1874c411429d2576e481

iVBORw0KGgoAAAANSUhEUgAAAEoAAAAJCAYAAACVHLqzAAAAWElEQVRIS2NkYGD4D8SjgEAIMIIC
Sq6bZTSg8ITAp93/GMABpbGTdTSg8ITA2yWjAUVUAhkNKKKCiYFhNKBGA4rIECBS2WiKIjWguPWZ
iNQyMpX9fvmfAQDvciQ25QMDBgAAAABJRU5ErkJggg==
--00000000000081b23905f882052b
Content-Type: image/png; name="Outlook-srrhm43n.png"
Content-Disposition: inline; filename="Outlook-srrhm43n.png"
Content-Transfer-Encoding: base64
Content-ID: <1874c411429caa7ff522>
X-Attachment-Id: 1874c411429caa7ff522

iVBORw0KGgoAAAANSUhEUgAAAdEAAABXCAYAAABbXX/qAAAUc0lEQVR4nO2dPZbcRpKAwxh/4K61
WHcdQScQeIIFT6Cis66aJ2DzBCy646h4AhVPMOAJBDnrCmOti73BZnRGUWARfxkRiQRQ8b2H180m
8qcqgYzM+Mu/gWEYhmEYLP6WugOGYRiGsVdMiBqGYRgGExOihmEYhsHEhKhhGIZhMDEhahiGYRhM
TIgahmEYBhMTooZhGIbBxISoYRiGYTAxIXpA/vPf/vs39yNTrrb7n//9x2vlOg3DMHaNCdFj8oe7
3inX+Ua5PsMwjN1jQvSAuB3js9uN/ux+zZWqbFydF6W6DMMwDoMJ0ePy1l2/KdZlGIZh3GFC9KC4
nePV7UZr92sprOrq6qrFHTIMwzggJkSPDdox/xTWYbtQwzCMEUyIHhi3g2zdbvTsfn1iVvEe61Dr
kGEYxsEwIXp83rvrBOEhL627zrpdMQzDOBYmRA+O20l2bjeKgvRDYFHchXYRumQYhnEYTIg+AE4Y
ninkpVhYpLaQFsMwjHlMiD4O6CD0z4X3vo/ZEcMwjKNgQvRBwDAVtxu9ul+rmVsvFtJiGIaxDBOi
jwXuRquJ/+/AQlqMANzCrARvJsjc9dPIbV/oZw0++1UXuVsPjRuTDPyY4IW/D41LBz49KP5sbOHM
x4ToA0EhL6iqHcur+9EmOGMK9/zk4L29/wuW29hL+vmO6mjAC9RP7nlr9Hr3uLjvtAC/QA4Zl6pX
Hn/U7voMPsFKq9e7Y/NViLovcam97Bvcl/1KrztfH4ZQT9Ih3ow9CNzPyqSjvnRLbnZ9q9yPX4Rt
vp9YWZ6p/uzu7y3m3J3oVwnypPYopK8hBZTaDeET16mKBMyvgrY3e1KO+2wn8M9NoVBdQdcTCdSP
Ukc2xXljDdjP2D3K41LS9YGynan1cwjXBo5XEav+ERp3/R8o7sD7O9FSWpkUUkNgvtdcWNVlZiVV
CusPBdUmzwvvrcFPxJmgPSz749B/UMjLW/h+sp9T4+L9uaBPLfjPFgoK0FLQbihf5m8Z5QTCvuKi
YUuqNZqkcQzySE0U7vqVJtS3gkk7gw3MYQuRPGMvrDAuJV6uHWzjfSRhWsD6Y/ZNe+7zde7HFfyC
oeZUuDV1Lr5IubCOBrZn1/vFDdacYH9hQsiFUOBLNvbg498p5KWkP9VTO0R37zPIxyU47pQmilLY
7pr8rFRHrVCPCNrZ4TNYrNRkBl6Y4qT9ZksLiS1BmhnpgjYEbOdXmi/eHlD9noFf/J7cZ2yB8ext
RoiSGvMkrKaDANXpimTgFwiLVHUk5KQqGlTJXCe+C7SNlvT76KKDtANS9XJw3Cm1u6YaVwQ9v7lC
Vfgyv035DNOiKdV3n7vrn5iu0n0HW1sMJ4V260+Jmi/d9Tv6VEyZfXZODv7Zu0KAHNmEEFWwJd3Y
8kqpClTVhcR1DpGBf+Geh/6TQl4u4O1wzUQ9H0CmWkY4cadPsN5qWwONXeiNEyRIudgzp5Rrtz3A
E+26Xm1wUbwqNC44FxRpe/LCO9cf9PZ9feBxqcBr814vkSebEKIgtwEilx1k2UGBNGirvCcgrnOK
dzNq5MmVPqn0ToL2keC4U1pU7WkXmoNsnO5BgXxWrG8W+gwoQIs1252hcNefrm+vNrw4jgq9gyhA
s7Q9+YYS/I7tyAucHP76jM3UjcmFKKmOSmE1DWzPDjrEpK1ygLm4ziXgAmXQg3rBCyD1dsT6OeOy
Fy/LG5VyfficFGsJjo1O1DcyWDiZHY2Nj0sBx1/gZLDg2UsqROkhke44OtimHXSMOVvlVxbEdS6h
5Hh8ko2vFLSLBMedkgqvEra7NlKb8VidbyLU+w09FW4Wuy0BGTyYIN24AL2RgXc6OvKONHPXb+4z
/jj2GZMJ0d7LK2XLdtAhMpiwVQ5wBq/eywVt4m70P5beTGMj3Q1Oxp1OsKtdKAn9PELVVWwHo56t
LY/VhiIZHH/CfoHGRcPEtQYFPIZqF8dj0DE05U5UI5xlD3bQIeZslV/pHWUmcbzKXR1PeJrLwvuf
QD42wWpcCmkphO2ujaZDUZ8M/I78Eql+JEWwu4QCJiazA7FmaJEGBfhnKbrmJCGjjqFJhKhSOEsD
+7CDjjFqq7xnIK6Tw01wd1M3kYOJRkjLNaSA0u53VajPp4hN4DhcYlSs9A6moApcEO4K/GywP3MG
gqFZn0Pf+52BZrX6/o+rC1GlcJYO9mUHHSLUVtmP6+SQgX8I5hYe70CuRuIsbjTaXZtT5PqjOBj1
1IVa1OCz8ODP9qZhoXcdrwJ8EvRKqb135FfQKtW3CSJ4pV/BZ0urYXhcSgjLtTsHqtvrnc/LUwzO
2Sl2ohq6/lR2UO1zNvOlN/biOk+C9jD2bjTpN9n3JPUj59CxoZf6aeKWi7v+xe5RGHXAvTEcioba
0FaTaSxYOnd9hIkUm/R3vGp3nUl4P8Fw7uYQsGwJ3+7SsR3u+8n1OeC2V4/8XSMmuwM/LucxYXY3
Ls+9QwU0xmUNte4FePPB38Ev5HJB299lFFtViCqFsySzg24gUwe+tBXIHnR8yMfUyBqe0pyJZW5X
xM5rGQumQ1ENfx1PtRRVB6MFC5YlXIGhCaL7cdI+g3/WOP2oYeCABRIMz4z6gJIH5KHlNOcDJa/0
C/gNRhdS6Pbd0SL9g7AfJ8pq1ArqmEMyH7wl3wvugqWCu0XCakJUKZylgX3bQUVQyAuuMqUhL9W9
7UIpTy0nP26p0G4KOA5Fn8DvAE4BZTLQdTCSvoNvpItYekZwMkMV8FLNVAvxEqFvAcm4dCBL3v8C
Cb7XNBdI1P0v+Y8lfYkJ+Zg0wAshyu5NLKsIUaVwlg72bwcVg6tfcjLKBdXgKux6+4diSMuZUU7T
NrcKAoeiK/jnOLSsioOR0BGqA5/qrZb24wYu5Cjp99Rkhu1Oqif3DmkHSmbxDnxqxEapOzch0wI/
7egau1ER+H1R1ANn3ivAb+heWGsnqhHOsrd40JjgblyyKMGQl+eeOuoJ5LaY4JUneSLmwnZTcGKU
uSXYuAmOPKCsloPRSVD2bQyVOk1maF74feC/r9Ruq93uxpDY1qMkoCAfDHynuYvcChLkfw7kAjwh
mvf/EV2IKrnS7zUeNAq0gq9Bpgb9hWwgiFTFVzMyImUK7aaCM+l96v1+hXB7IGofGka793VwiKpG
JUGKC8PbhNZAJKG9USpmuagbC9qR5sB7T1fP/xwKxeDXIDQnRRWiSuEsDTywHXQC/E6GVu9LyUAv
rIRj/9DwRFwdsu3ngcW6Oxs0CtSnwDpOIHgP6F0sGEWbNRzq0BTg+viD+/XLIy2Ymc8TUq8RK0vm
I04YDGpP8gfQIkTfiUrDWTowO+ggtHq/gGyXLyl7I9j2oXQ6TCo4u9Br/x80di2ETZ5Z4OEF95TM
cqstYN1n26wzSkQqZjntcLspuMcyVrDx3SgomJOiCVGyd5XCajZlB6UQHS0Wpf2b4XbKSybtDJMO
eC/JrjIT3SAVdMUo+nHkb6HfA6rILoz2kZ8YZZoHUqmmgjMuweYTCWQfbSB8N/qDfm/0EGgBviGK
EKXOSSfKLdpBNW14NXi3fTa9vLqphFJwTJrS6TCpqCB8wdKOLASvED5upUBFVjDKDAl/Q5eCUebT
/C3q4LMQaporIvRDE+682fb/oS5ElVKKNWB20EWQLQlVjPnKTTehi5w95se9Q6zKvUExvzWELyiw
D5x3o2CUqRlljIXQ+5Axil5VO7KMmlGmUO6DGu67RxlVMos3/X/E2Inibq0QlO/A7KChoC2JG9PF
hTORP8E+Q1pu2pWCUXRqN4c7ijKwvhMEfvc0WYfSPoJTSGIKRpkkuWlp0ddC4Pu7JeeinjkGF6IF
s5ruXrOkKkRJVfckrGZTdtA9QDaLGtZTk16YNhmO/QfB8wqZRb/jFbPvnF1oMzOBXCFca8NxMCoC
20BaRhkjPm3itvPAMjno91lzPgjlev8HNSGqpMbdoh10L+Bu9M8V2ulgXc/A5AgciiZtV2TTvkC4
p7LEwWgpXyLXb/BY6yCGIfCZKBO2vwW+e6fFQhQnGFIvaMT9mR2UCalbULjFTmDwcSvqmRWpgPds
Xxbc8xnChajEwcgwDB5tlEO5e/p5jRNGlpx3aYxzBvlxRlO0sP24rxiwHIqW2K4o+xTelzH6ZO+K
YazH4Pumps6lnRA2IlHp4nmXXw5+Ono0SD0oHYMpgk9p2TsCh6LPAfdeYOUMRgvg2q+NuPw9YduP
/Excx+SSqmMR5VrEFFGVoBo8HX3OIcMYgcZA4n02Rv2g9mrOLrSDsDAEThrAbOhIuxGawLqRnFHG
iE+RsO2MUaZV7kMKOphIbRojxAUbK4D/EmbgTyj5Uac7Dwk3TddcnQ+FwKFokSr3BjMNIIIORtcF
9XcMb8bc7K7RaRhlSuU+LILehSK03AGenw68R383doO6EKUXVhq3iMmLP7i6Hm7i1oBCXq4g0wj0
uTxo2FEFvNV3iCr3BicNYBUg6BoInwRLiO8F/LDQXNlB4DMWoIHQpGKUaZX7sDYdLDhqLkraP5rE
pZ6iW7SPaoZ2tIp1DYELkBLkTkYdPOAulOAcHdYyn1ksw8nmdHLX84L7GggXoiqHgRuTNBC+u1yk
gVCG8y402p1YkRb8IfTN3I3REtALjtDpsyn76BpHQmlBjl64u5GGvHx8NGcihI4OKxlFO8FBBR2E
L3pwclvS3h+B9SKoESotCX1UOLGXIRoIMfgMAO9d2Gus8RkCnChjH4X2GvyZlxmzPJYz+yifM/hJ
NmeWb/e0cFCG41CEFLCu80e+UL2H/8/Z6WKZVd4/ymf6eWPap9jUwFvo4nf1Srcro3AX4rVmJ1bi
GmpGjCpEewkAJEnHzT7KpHfKCzfk5ZG/81PqDgQwq96jd7EB3uHKz7EXU5jKEPx3fqIUlg+R/pNM
Xx2EbzRK4fmyixAcaTl2etHWCd7lx96J3k4ZwfiiSlDNFu2ju4BCXlhCdEPfNwrzRqmu2XpoQs+U
2luDpS8+htIUjPrfkVnlyig7y8DRiaW7fqeUiMHH7e2QK/AWbR9oXBrV3hCkxuVugGIe1zY1H2Tg
Nw2ZoP6gXX50IUqgt24Jwg+2JfuosSprHw7NcaJIzQnmbaNX4E+K+P6p7y5IgKInfzbw3yfwC4SP
BzcroO/CiVEuA5+MfdaDNBQal98EVVx0ejLI5HxAfZf4gpQhHtCrCFFSK6J9VBL2koHZR43ICByK
UjPrYEQq3QvIJuy3WipEOvVpbteA/4c7Yfx8b47o5ERxwjXwnrsM/Li81vpuFo7LFJfEm50zyHxB
EFxsXpfcuNZO9Kb7P4PsqDSzjxqx4ToUpWapgxHayE/MNjLwO1L0umef+UuB+7hTeAooloMXFjW1
3XLa3jA4LiWzbAb+u8E6ziuPyxBJT3lS8AVB8qW+AKsJUQSFH+nZC0E1yeyjgtAFDvURV9074JS6
AwKWOhhdQPY5K/AqL1RDLp60aZJ+AtkhCaW7/sSELkdKQ6l0JjAKwJ9JgCzOmqU0LjdS70JfIF8Q
fB9KQTW/4MZv7ntcVYgSt2xGmaCOVPbR2MeM3VOv3N5Ds0OHonuq3tGEU6AmpwLZZ8Wy+D68o+xY
GBPYgLdXfW2/t2iWOhfeUyvWtRU0zgTOwe/APvTH5d5m2jtYQZrrvE8H2zprGJ/z3wXlM/Bq3dG8
ucjqQpT0/9KwlwzMPmros0eHontOMHNcXS81p8RxpE8FvYmYkac3lPdb2O1oo3wmcAYUMoT/WGFM
kE2NC8maC8i0LidybGvGbkixE9UKezH7qKGG0KHoDLx8uVPgRFoyyqFK7jx3E51jeoH9qa/rI3vq
UqY3nBvL1H0JBNXH59SdGEBD64IbvtGQlyRClNAIe7H4UUOLk6DsR+0VuECo5wGp+nCCKSDt8Voh
tOCzoB0d/Iyo1s0S92MpDcyoPFNBWhdp+tPJxBbJhKhS2Ati8aOGBlxVbqxn7wp870L8LPXcTfQO
4gp7DxN2Bz4heJe4H9HpjYvUd2QNOhB4aq8B7e6lIS8vtv+hz5lyJ6oV9pKB2UcNARQXlzOLR8nM
QhPpFXgmjxPFc3YL29n6hN3BgiOpjgTZ82xc9ECti8QHIAcvp57v/yOpEEWUwl7MPmpIkDgUXbU6
MQDaWStm2RMssI0ivQkbJ5mc2V4sOtjPRK3KxgVpBzsaF/IBqEEe8vJdCE9yIUpohL2YfdQIhmyP
FbN4bDPCFfgq3UUORjdowkZtDr6HBbNNbRrwKtw2cT+S0ROk+BwUibtzowEvQLvE/QhFGkKUgbet
fmP/3YQQVQp7Qcw+aoRyEpSNmWRbqtINcTD62p778SNqdUCetUbKBR4j+fwsPUGK43JK3J3zXjV+
FEJ0BtmzjaaST/33ahNCFFEKe8nA7KNGGBJV7kWrExOgoK6YZRc5GN1DJhZUJeOkXTDb5tLCQXPk
SqDFxJveuOQrd6GFY4zLLe1lJqjjmzN2NyNECY2wF7OPGosQOhQtTqsmgWw52E7GKL7YwWig3Rr8
rvQEXoWVM9oPoQN/mgk79+sj0LPtPYFOmr45OvAhXM+R21mFXl5d6RnXX0Ne+kK0FlSqQi/sRZqx
o5g5X7EW1r8GrWJdtWJdEhpmuU6xD30K4H83UVW5d6Bw+YlZtgSB8xNNFBcSpjhpF9y6RmjBf75L
QuHZJGqXBX1Pzz3VpDR8Y4gW4o9LwyzXSRrtaT0zQTWYLvGCv3wVoq7ixYeQxoRWwHXkNjbxWddi
K593a9qBvayut9DPnjAtwE/aJfAFagtesH/agnfn1p7LpdyEKXiBWoGf2EvgC9QWVhyXlN+7a1st
acfW1LmGYWwYmlzxup3+UYCfuP8dxifv1l3/gr8S1LfxeviYUFQCXjeP84KuH2B8x9W56w+wcRFh
QtQwDBa0E6phO+YCA7wXKvy1qzQiY0LUMAzDMJiYEDUMwzAMJiZEDcMwDIOJCVHDMAzDYGJC1DAM
wzCYmBA1DMMwDCYmRA3DMAyDiQlRwzAMw2Dy/52NBVAw4SfHAAAAAElFTkSuQmCC
--00000000000081b23905f882052b--

