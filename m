Return-Path: <paul.leguendekerneizon@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1A5D65C6F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:36:37 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17822.1765985789337273407
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 07:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=OpuqnCMf;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8E7413D836A2;
	Wed, 17 Dec 2025 10:36:28 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id u9zAn3WubQor; Wed, 17 Dec 2025 10:36:26 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3DB763D84821;
	Wed, 17 Dec 2025 10:36:26 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3DB763D84821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1765985786; bh=qJI/WRpAVk+i2xkwJ3Aa9a5r2H78hA6Vf/BdUWCJSIs=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=OpuqnCMfSWPZqSuU26G3Q81SsTVyXHsSg6pkMinV81sqPGZuJPvUaMHrxjpbp76eF
	 1i/rvoWchY7rmbFNgoF1FNwCS68eBOTjH9GSZAUjhJ0vd1coAIsoBGruPqtoWUUYYi
	 njwyrycniixPP7a7GgYF30Q6EEaAA9W136/kgHNpnMLutmw0wUtx4UgnC6k6/lsSQi
	 s6KR2qXF49ccO2vQjlra6p3/wjrfSTD1ltrP4eoRBN30h+rPvNBA8k2p0M00D7w4LH
	 A+cjycACTxDetQitlT2s8u8iIQu3tKiTkhTaepHXPC2AOYcsYX7x3WP5wYKkOatIqQ
	 ycn1k005jp8Yw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 4FSUiiK-qgQD; Wed, 17 Dec 2025 10:36:26 -0500 (EST)
Received: from [192.168.216.88] (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A73313D836A2;
	Wed, 17 Dec 2025 10:36:25 -0500 (EST)
Content-Type: multipart/alternative;
 boundary="------------hUN10wHAMRA7jAPD2vv6gRsk"
Message-ID: <290d7683-131d-417b-8f62-ca55305ed378@savoirfairelinux.com>
Date: Wed, 17 Dec 2025 16:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 0/1] add support of cockpit-machines
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20251217092132.18256-1-paul.leguendekerneizon@savoirfairelinux.com>
 <CADkTA4Prr_u7grQ_9DWF183LDka+2nu2yGdpYeA1XC4rWkaCRw@mail.gmail.com>
Content-Language: en-US
From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
In-Reply-To: <CADkTA4Prr_u7grQ_9DWF183LDka+2nu2yGdpYeA1XC4rWkaCRw@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 15:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9493

This is a multi-part message in MIME format.
--------------hUN10wHAMRA7jAPD2vv6gRsk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Bruce,
Thanks for your review!
Here are my answers:

    I think we can still hold off on that, but it would be nice to put a =
comment
    above LAYERRECOMMENDS_virtualization-layer to indicate that this
    package also required meta-webserver

What is for sure is that there is an hard dependency to cockpit package,=20
cockpit-machines cannot work on its own. I added a comment for now in=20
the layer.conf file to mention this dependency.

    The next question is: can you put a description of how someone would
    test / use the package into the commit message ? Nothing elaborate, b=
ut
    just something to help me later when I'm potentially upreving it.

Yes! I added some explanation in the commit message. For testing, the=20
Cockpit URL https://127.0.0.1:9090/machines, from the tested target=20
should be accessible.

    Last question .. the recipe excludes musl (fine with me), but are the=
re
    any arch considerations ? I don't think there should be given how it =
is
    configured and built and the description, but if there are, we should=
 just
    restrict it up front versus someone asking questions about riscv64 la=
ter =F0=9F=99=82

 From what I am seeing, there are no arch restrictions. Cockpit and=20
cockpit-machines are supported on many arch, including risv64. I cannot=20
test it on this specific arch, but I am seeing that Debian team package=20
cockpit and cockpit-machines for risv64/all arch (see [1].
Regarding musl compatibility, it is mainly due to the non-compatibility=20
of systemd with this lib (see [2]), which cockpit depends on.

I pushed the needed modification in the V2 patch.

[1]: https://packages.debian.org/search?keywords=3Dcockpit
[2]:=20
https://github.com/cockpit-project/cockpit/pull/19513#issuecomment-177460=
7891

Thanks,
Best regards,
--=20
Logo Savoir-faire Linux inc.
Paul Le Guen de Kerneizon
Free software consultant | Rennes, France
Logo Jami pleguendekerneizon


On 17/12/2025 14:26, Bruce Ashfield wrote:
> On Wed, Dec 17, 2025 at 4:21=E2=80=AFAM Paul Le Guen de Kerneizon via
> lists.yoctoproject.org
> <paul.leguendekerneizon=3Dsavoirfairelinux.com@lists.yoctoproject.org>
> wrote:
>> Hello community,
>>
>> Since version 242 of Cockpit package, plugin `cockpit-machines` has be=
en moved
>> to a dedicated repository. This cockpit plugin is used to manage in we=
b UI
>> virtual machines. There is currently no support of the new cockpit-mac=
hines
>> package in any Yocto meta and the following patch bring it.
>> This recipe is suggested to be added in the meta-virtualization in
>> order to fulfill the needed dependencies on `virt-manager` and
>> `libvirt-dbus` recipes.
> Hi Paul,
>
> Thanks for the contribution!
>
> The recipe itself is simple enough, so no concerns there.
>
> The medium sized question is the dependency on cockpit, which is
> maintained in meta-webserver (from the check I just did on the layer
> index).
>
> meta-webserver is currently in the layer conf file in the
> LAYERRECOMMENDS_virtualization-layer variable (but not mentioned
> in the README.md .. I can fix that part though). So we do already have
> recipes in meta-virt that need meta-webserver. I'm just pondering wheth=
er
> adding this bumps it up to LAYERDEPENDS_virtualization-layer.
>
> I think we can still hold off on that, but it would be nice to put a co=
mment
> above LAYERRECOMMENDS_virtualization-layer to indicate that this
> package also required meta-webserver
>
> The next question is: can you put a description of how someone would
> test / use the package into the commit message ? Nothing elaborate, but
> just something to help me later when I'm potentially upreving it.
>
> Last question .. the recipe excludes musl (fine with me), but are there
> any arch considerations ? I don't think there should be given how it is
> configured and built and the description, but if there are, we should j=
ust
> restrict it up front versus someone asking questions about riscv64 late=
r :)
>
> Cheers,
>
> Bruce
>
>
>> Waiting for your review, feel free to ask any questions or remarks.
>> Regards,
>> Paul Le Guen de Kerneizon, Savoir-faire Linux
>>
>> Paul Le Guen de Kerneizon (1):
>>    cockpit-machines: add recipe
>>
>>   .../cockpit-machines/cockpit-machines_346.bb  | 30 +++++++++++++++++=
++
>>   1 file changed, 30 insertions(+)
>>   create mode 100644 recipes-extended/cockpit-machines/cockpit-machine=
s_346.bb
>>
>> --
>> 2.34.1
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9488):https://lists.yoctoproject.org/g/meta-virtua=
lization/message/9488
>> Mute This Topic:https://lists.yoctoproject.org/mt/116824038/1050810
>> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--=20
Logo Savoir-faire Linux inc.
Paul Le Guen de Kerneizon
Free software consultant | Rennes, France
Logo Jami pleguendekerneizon
--------------hUN10wHAMRA7jAPD2vv6gRsk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Hello Bruce,<br>
    Thanks for your review!<br>
    Here are my answers:<br>
    <blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">I think we can still hold of=
f on that, but it would be nice to put a comment
above LAYERRECOMMENDS_virtualization-layer to indicate that this
package also required meta-webserver</pre>
    </blockquote>
    What is for sure is that there is an hard dependency to cockpit
    package, cockpit-machines cannot work on its own. I added a comment
    for now in the layer.conf file to mention this dependency.<br>
    <br>
    <blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">The next question is: can yo=
u put a description of how someone would
test / use the package into the commit message ? Nothing elaborate, but
just something to help me later when I'm potentially upreving it.
</pre>
    </blockquote>
    Yes! I added some explanation in the commit message. For testing,
    the Cockpit URL <a class=3D"moz-txt-link-freetext" href=3D"https://12=
7.0.0.1:9090/machines">https://127.0.0.1:9090/machines</a>, from the test=
ed
    target should be accessible. <br>
    <br>
    <blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">Last question .. the recipe =
excludes musl (fine with me), but are there
any arch considerations ? I don't think there should be given how it is
configured and built and the description, but if there are, we should jus=
t
restrict it up front versus someone asking questions about riscv64 later =
=F0=9F=99=82</pre>
    </blockquote>
    From what I am seeing, there are no arch restrictions. Cockpit and
    cockpit-machines are supported on many arch, including risv64. I
    cannot test it on this specific arch, but I am seeing that Debian
    team package cockpit and cockpit-machines for risv64/all arch (see
    [1]. <br>
    Regarding musl compatibility, it is mainly due to the
    non-compatibility of systemd with this lib (see [2]), which cockpit
    depends on. <br>
    <br>
    I pushed the needed modification in the V2 patch. <br>
    <br>
    [1]: <a href=3D"https://packages.debian.org/search?keywords=3Dcockpit=
"
      class=3D"moz-txt-link-freetext">https://packages.debian.org/search?=
keywords=3Dcockpit</a><br>
    [2]: <a
href=3D"https://github.com/cockpit-project/cockpit/pull/19513#issuecommen=
t-1774607891"
      class=3D"moz-txt-link-freetext">https://github.com/cockpit-project/=
cockpit/pull/19513#issuecomment-1774607891</a><br>
    <br>
    Thanks,<br>
    Best regards,<br>
    <div class=3D"moz-signature">-- <br>
      <div class=3D"wrapper"
style=3D"font: 14px arial, sans-serif; font-weight: normal; max-width: 48=
0px;">
        <div class=3D"logo" style=3D"margin-bottom: 10px; width: 100%;"><=
img
src=3D"https://static.savoirfairelinux.com/img/signature-courriel/logo-si=
gnature-sfl.png"
            alt=3D"Logo Savoir-faire Linux inc." width=3D"138" height=3D"=
39"></div>
        <div class=3D"wrapper-name" style=3D"margin-bottom: 20px;">
          <div
style=3D"font: 18px arial, sans-serif; font-weight: bold; color: #2b2e30;=
 margin-bottom: 5px;">Paul
            Le Guen de Kerneizon</div>
          <div style=3D"color: #768089;">Free software consultant |
            Rennes, France</div>
        </div>
        <div class=3D"phone-ring"><img
src=3D"https://static.savoirfairelinux.com/img/signature-courriel/jami-pi=
cto.png"
            alt=3D"Logo Jami" title=3D"Jami" width=3D"14" height=3D"13"> =
<span
            style=3D"color: #768089;">pleguendekerneizon</span></div>
      </div>
    </div>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 17/12/2025 14:26, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4Prr_u7grQ_9DWF183LDka+2nu2yGdpYeA1XC4rWkaCRw@mail.gmai=
l.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Wed, Dec 17, 2025 at 4:21=
=E2=80=AFAM Paul Le Guen de Kerneizon via
lists.yoctoproject.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:paul.leguendekerneizon=3D=
savoirfairelinux.com@lists.yoctoproject.org">&lt;paul.leguendekerneizon=3D=
savoirfairelinux.com@lists.yoctoproject.org&gt;</a>
wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
Hello community,

Since version 242 of Cockpit package, plugin `cockpit-machines` has been =
moved
to a dedicated repository. This cockpit plugin is used to manage in web U=
I
virtual machines. There is currently no support of the new cockpit-machin=
es
package in any Yocto meta and the following patch bring it.
This recipe is suggested to be added in the meta-virtualization in
order to fulfill the needed dependencies on `virt-manager` and
`libvirt-dbus` recipes.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Hi Paul,

Thanks for the contribution!

The recipe itself is simple enough, so no concerns there.

The medium sized question is the dependency on cockpit, which is
maintained in meta-webserver (from the check I just did on the layer
index).

meta-webserver is currently in the layer conf file in the
LAYERRECOMMENDS_virtualization-layer variable (but not mentioned
in the README.md .. I can fix that part though). So we do already have
recipes in meta-virt that need meta-webserver. I'm just pondering whether
adding this bumps it up to LAYERDEPENDS_virtualization-layer.

I think we can still hold off on that, but it would be nice to put a comm=
ent
above LAYERRECOMMENDS_virtualization-layer to indicate that this
package also required meta-webserver

The next question is: can you put a description of how someone would
test / use the package into the commit message ? Nothing elaborate, but
just something to help me later when I'm potentially upreving it.

Last question .. the recipe excludes musl (fine with me), but are there
any arch considerations ? I don't think there should be given how it is
configured and built and the description, but if there are, we should jus=
t
restrict it up front versus someone asking questions about riscv64 later =
:)

Cheers,

Bruce


</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
Waiting for your review, feel free to ask any questions or remarks.
Regards,
Paul Le Guen de Kerneizon, Savoir-faire Linux

Paul Le Guen de Kerneizon (1):
  cockpit-machines: add recipe

 .../cockpit-machines/cockpit-machines_346.bb  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 recipes-extended/cockpit-machines/cockpit-machines_34=
6.bb

--
2.34.1

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#9488): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/9488">https://l=
ists.yoctoproject.org/g/meta-virtualization/message/9488</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.yoctoproject.org/mt/116824038/1050810">https://lists.yoctoproject.org/mt=
/116824038/1050810</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-vi=
rtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@list=
s.yoctoproject.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.yoc=
toproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org=
/g/meta-virtualization/unsub</a> [<a class=3D"moz-txt-link-abbreviated" h=
ref=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
</pre>
    </blockquote>
    <br>
    <div class=3D"moz-signature">-- <br>
      <div class=3D"wrapper"
style=3D"font: 14px arial, sans-serif; font-weight: normal; max-width: 48=
0px;">
        <div class=3D"logo" style=3D"margin-bottom: 10px; width: 100%;"><=
img
src=3D"https://static.savoirfairelinux.com/img/signature-courriel/logo-si=
gnature-sfl.png"
            alt=3D"Logo Savoir-faire Linux inc." width=3D"138" height=3D"=
39"></div>
        <div class=3D"wrapper-name" style=3D"margin-bottom: 20px;">
          <div
style=3D"font: 18px arial, sans-serif; font-weight: bold; color: #2b2e30;=
 margin-bottom: 5px;">Paul
            Le Guen de Kerneizon</div>
          <div style=3D"color: #768089;">Free software consultant |
            Rennes, France</div>
        </div>
        <div class=3D"phone-ring"><img
src=3D"https://static.savoirfairelinux.com/img/signature-courriel/jami-pi=
cto.png"
            alt=3D"Logo Jami" title=3D"Jami" width=3D"14" height=3D"13"> =
<span
            style=3D"color: #768089;">pleguendekerneizon</span></div>
      </div>
    </div>
  </body>
</html>

--------------hUN10wHAMRA7jAPD2vv6gRsk--

