Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ADBC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 15:23:43 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web08.119.1667489017333361496
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 03 Nov 2022 08:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nd6aql1N;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id h206so1588173iof.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 03 Nov 2022 08:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1dxISOqvmYoN+oYQ8/tmIOCtUZb9NETotpHHqV8o7/8=;
        b=Nd6aql1NbO9q7xa3rHG2LL1Dv7hNylq+rvrPx11AOlsZH3okG+uyuYAQ5AO06Lk3E/
         bvzEUGUCRfWRlf5IuSEGi+F/lHqAMFo0bJPBBDyl0iUu4OoEbQ6QbBqRQK+DSfoZEBKV
         h6YoaqRc7/uS1kQnzPF1+wTAKU+hNyHmzMe0ysRu1l4k+uxcNq8IarjfFMioqpaBZOJZ
         z2Zrlt+E79vuPVBIFeI/qKpBoP/zyLvLbieKACCdmBzA/cKk4dxpBWluxGptFPP8QaLS
         TFHZ1z/DgszHkL09Au/84pOU3OBGIeb1jzr2zzQUfS+pdxKPHXLuDRe6gK6qn3ibxiJ7
         l4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dxISOqvmYoN+oYQ8/tmIOCtUZb9NETotpHHqV8o7/8=;
        b=yZ+ZGodoD7FlrFWjMHz6j07W4D2s3HadqCdhhYbv9jemlHxLKUsjhAhcso+nwpCL4B
         KiX/U22p4Z/1jrjPCo06+8lPPzy2MtmeV9grtIi9/oIurgub2fJWrxdJbL6AumLL3RXQ
         QssLZhml2uaWdKi68EGjDvn3SJaWHpP467KMTktQO1XvNSCRHtty2ijflxq1GRQhALrw
         Jgdz1yBdtdNRzKIZ1YWpwV3BmxqlWDBJH1O+7Uf3o8ravpa1zB5rTNsNwYazpNxvfNuw
         ljaklkz9tGTEEvjm2XYv6EciQaogDBA31xey5BRS1gu6V7iVP3li6f9gG6oq8vJoLOiv
         /YsA==
X-Gm-Message-State: ACrzQf199M3imMEFjk1XCx24QOi6/4+AHtnkDTJcZI7mua6PqJsPY2fS
	gA/1urvmmboHCSAkSEn4cD9niQEzVcdua8u5J5Q=
X-Google-Smtp-Source: AMsMyM7DKylcbIce80mmX1gCkJN34+3VQUjQ61x4RTA5GbMTYAvJ9FaWejYrtB0AGzd7gGHt614tt5BFJOdNy3scNEo=
X-Received: by 2002:a05:6602:1514:b0:6d4:4a32:5f04 with SMTP id
 g20-20020a056602151400b006d44a325f04mr6335771iow.99.1667489016483; Thu, 03
 Nov 2022 08:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221030161333.12430-1-f_l_k@t-online.de> <20221030161333.12430-2-f_l_k@t-online.de>
 <CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com>
 <6GGOKR.9UDK9PG7M6LM3@t-online.de> <1723CB4C1BEE0B79.10635@lists.yoctoproject.org>
In-Reply-To: <1723CB4C1BEE0B79.10635@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Nov 2022 11:23:25 -0400
Message-ID: <CADkTA4N0z=j7AjV9g1-kHnTzX8vSgDSL_4Qj8iNZaeXjyQdtwQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
To: bruce.ashfield@gmail.com
Cc: Markus Volk <f_l_k@t-online.de>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007e9b4f05ec928aa9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 03 Nov 2022 15:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7675

--0000000000007e9b4f05ec928aa9
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 2, 2022 at 10:36 AM Bruce Ashfield via lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:

>
>
> On Tue, Nov 1, 2022 at 12:29 PM Markus Volk <f_l_k@t-online.de> wrote:
>
>> Am Mo, 31. Okt 2022 um 12:04:37 -0400 schrieb Bruce Ashfield <
>> bruce.ashfield@gmail.com>:
>>
>> These dependencies are the biggest "issue" with the recipe.
>> meta-virtualization doesn't currently have a dependency on the layers that
>> provide those packages.
>>
>>
>> Hi Bruce,
>>
>> thanks for the review. I tried to follow your suggestions, but since I
>> didn't know of a suitable distro feature that would ensure meta-gnome is
>> included, I cleaned up the dependencies and used a configuration that
>> doesn't include it by default. This way, the recipe hopefully doesn't have
>> to be skipped and can be built with only the layers that README says are
>> needed. (Assuming that spice-gtk, which is currently being tested in
>> meta-networking master-next, will be good to merge).
>>
> Thanks for the quick turnaround on the v2!
>
> The packageconfig route solves the problem, and I'll pull these in for
> testing.
>

During my test builds, I am seeing this QA warning:

NOTE: Executing Tasks

WARNING: virt-viewer-11.0+gitAUTOINC+1e99e5e4f4-r0 do_package_qa: QA Issue:
File
/usr/src/debug/virt-viewer/11.0+gitAUTOINC+1e99e5e4f4-r0/src/virt-viewer-enums.c
in package virt-viewer-src contains reference to TMPDIR

File
/usr/src/debug/virt-viewer/11.0+gitAUTOINC+1e99e5e4f4-r0/src/virt-viewer-enums.c
in package virt-viewer-src contains reference to TMPDIR [buildpaths]
NOTE: Tasks Summary: Attempted 3632 tasks of which 3611 didn't need to be
rerun and all succeeded.

but libvirt still has other TMPDIR QA warnings that still haven't been
fixed, so I don't consider this an absolute blocker. I'll have a look and
try to fix it.

Bruce



>
> Bruce
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7674):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7674
> Mute This Topic: https://lists.yoctoproject.org/mt/94667263/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007e9b4f05ec928aa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 2, 2022 at 10:36 AM Bruce Ashfield via =
<a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;br=
uce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.co=
m@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 1, 2022 at 12:29 PM Markus Volk &lt;<a =
href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div i=
d=3D"m_2943632610562546846m_6608397856802233588m_8730113892122364741geary-b=
ody" dir=3D"auto">Am Mo, 31. Okt 2022 um 12:04:37 -0400 schrieb Bruce Ashfi=
eld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce=
.ashfield@gmail.com</a>&gt;:<br><blockquote type=3D"cite">These dependencie=
s are the biggest &quot;issue&quot; with the recipe. meta-virtualization do=
esn&#39;t currently have a dependency on the layers that provide those pack=
ages.=C2=A0</blockquote><div><br></div><div>Hi Bruce,</div><div><br></div><=
div>thanks for the review. I tried to follow your suggestions, but since I =
didn&#39;t know of a suitable distro feature that would ensure meta-gnome i=
s included, I cleaned up the dependencies and used a configuration that doe=
sn&#39;t include it by default. This way, the recipe hopefully doesn&#39;t =
have to be skipped and can be built with only the layers that README says a=
re needed. (Assuming that spice-gtk, which is currently being tested in met=
a-networking master-next, will be good to merge).</div></div></blockquote><=
/div><div style=3D"font-size:small"></div><div style=3D"font-size:small">Th=
anks for the quick turnaround on the v2!</div><div style=3D"font-size:small=
"><br></div><div style=3D"font-size:small">The packageconfig route solves t=
he problem, and I&#39;ll pull these in for testing.</div></div></blockquote=
><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small"=
>During my test builds, I am seeing this QA warning:</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:14px;line-height:no=
rmal;font-family:&quot;Andale Mono&quot;;color:rgb(161,161,161);background-=
color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(255,255,255)">NOTE</span><span class=3D"gmail=
-s2" style=3D"font-variant-ligatures:no-common-ligatures">: Executing Tasks=
</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:14px;line-height:no=
rmal;font-family:&quot;Andale Mono&quot;;color:rgb(159,160,28);background-c=
olor:rgb(0,0,0)"><span class=3D"gmail-s2" style=3D"font-variant-ligatures:n=
o-common-ligatures">WARNING</span><span class=3D"gmail-s3" style=3D"font-va=
riant-ligatures:no-common-ligatures;color:rgb(161,161,161)">: </span><span =
class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures">vir=
t-viewer-11.0+gitAUTOINC+1e99e5e4f4-r0 do_package_qa: QA Issue: File /usr/s=
rc/debug/virt-viewer/11.0+gitAUTOINC+1e99e5e4f4-r0/src/virt-viewer-enums.c =
in package virt-viewer-src contains reference to TMPDIR</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:14px;line-height:no=
rmal;font-family:&quot;Andale Mono&quot;;color:rgb(159,160,28);background-c=
olor:rgb(0,0,0)"><span class=3D"gmail-s2" style=3D"font-variant-ligatures:n=
o-common-ligatures">File /usr/src/debug/virt-viewer/11.0+gitAUTOINC+1e99e5e=
4f4-r0/src/virt-viewer-enums.c in package virt-viewer-src contains referenc=
e to TMPDIR [buildpaths]</span></p>
<div class=3D"gmail_default" style=3D"font-size:small"><span class=3D"gmail=
-s1" style=3D"font-family:&quot;Andale Mono&quot;;font-size:14px;font-varia=
nt-ligatures:no-common-ligatures;color:rgb(255,255,255)">NOTE</span><span c=
lass=3D"gmail-s2" style=3D"color:rgb(161,161,161);font-family:&quot;Andale =
Mono&quot;;font-size:14px;font-variant-ligatures:no-common-ligatures">: Tas=
ks Summary: Attempted 3632 tasks of which 3611 didn&#39;t need to be rerun =
and all succeeded.</span></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>but libvirt still has other TMPDIR QA warnings that still haven&#39;t been=
 fixed, so I don&#39;t consider this an absolute blocker. I&#39;ll have a l=
ook and try to fix it.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div><div s=
tyle=3D"font-size:small">Bruce</div><div><br></div><br clear=3D"all"><div><=
br></div>-- <br><div dir=3D"ltr">- Thou shalt not follow the NULL pointer, =
for chaos and madness await thee at its end<br>- &quot;Use the force Harry&=
quot; - Gandalf, Star Trek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7674): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7674" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7674</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94667263/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/94667263/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000007e9b4f05ec928aa9--

