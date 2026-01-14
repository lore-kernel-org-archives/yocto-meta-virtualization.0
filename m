Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAF3D37E39
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 14:13:35 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11015.1768400009915919117
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 06:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AbXGNESI;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f216280242so341305b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Jan 2026 06:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768400009; x=1769004809; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S2FobvnmPsn4Z97N1461Djv+blLI6Xh1mfReUzF/v6M=;
        b=AbXGNESI9msGw57oy7tGlNtMc9vJBtUJRzZoyemZUNJw4dR2eMmazEYkNuZlsB4ngL
         0efHJfCpO1na8vgD8Hh+cjk+XLV4eHLN2tZL7YyBx062L16PEtBzCzsuJVN9A6QRslCh
         ZHqH6IDpWNmgBvO8ZpQL5LlbS/Gi9nqzo6qGNo1Zcpqm881zPmxgASjD1j8/YdO0kQaT
         A1VYMwWOWeb2PvFzg8TWJfVHPgzPvj3RNYosFgfYH5Ti2740jacv0zsQVZA+FcCTfnQD
         4QCstJcsxJApOwy0t1F9fFiZ+plhi28EIZv572INW4XuB1j6h0b6BVvJd/Ca7bsEawcI
         CnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400009; x=1769004809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2FobvnmPsn4Z97N1461Djv+blLI6Xh1mfReUzF/v6M=;
        b=EIawwDFvM6ygN55iFvGTu801UPoqKfVjtHqYjPjcjLDpyN9bv0svv5Pdgbg9sxEnG8
         TrGO1gu0FaKltddYJipep4OvQW0prng6d3r8qGeLxoYoiQRDkLdrL3qKEo0DAo/veLUL
         E7+BqmfMrFuFDOFj+CxsBL1HTzT3CRQWXqn+1WhCgu4P73BjnhRCCWp+7H5/mECCzOGM
         Hs3LJ3aqSZl4fe/47FGLoEYrMTgQaOn0w64QbQzt4bxA7tCEsQPUHTr1LpFk6Z6c9Dx6
         yafSVYMW9eJ/ZeJ73SYF/2BeFumY+uMVXC06k77nzrgV92okv2vpVx1ejUQIJbIxKkyv
         qQuA==
X-Gm-Message-State: AOJu0YzQbBlq0898UGEOjwN281Dt7RCzQTntNltPeKLb6cSBvP6ga7oo
	6Ts7FCk3d6k4RiCApTZ1Qjh/cpn+JkpWVOl3CPw83KJm9UNU0YkYioWTRWYuXGYfd+PA8s1hO7U
	aulOqL5ZYvcBcsOKoEShdYRNZecEf8/5dGI8Vmg79wg==
X-Gm-Gg: AY/fxX4ir8VtJrcj+EQEOyEMbz16zmwT9UKyHSNZ8qaIql+rfFafeIJ2Wl3Dt1PUUJB
	wlq46v3VPrjsfvfohBVOfWuk7ifqV8YTQt5rgsSqGDdBw/hCKw0tDMtZRrNk+5g63KSWyqHT715
	/0KuFhx5R4SNCqwi66DZ/2dvAkb8x70ZLmF4k1zGp5C/JDPPrKxNHh4zJoDEHXLg7w7bsG6dW5D
	Hs0F0GtZWWOk7gdzWf4EksX6L+LMViK0skSV3T+aRkU2U+eXiWoLXjDGqHtOkx/7cFR9uCR
X-Received: by 2002:a05:6a20:7d9f:b0:2cb:519b:33fe with SMTP id
 adf61e73a8af0-38bed3887ecmr3044586637.21.1768400008877; Wed, 14 Jan 2026
 06:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20260108062628.3636344-1-changqing.li@windriver.com>
 <CADkTA4MB=AckiSmwRHJFjg_X2oYCCfRTEFydoWs2TNqDJK=7rw@mail.gmail.com> <f8d5d7c8-4f93-461f-a6d2-4840cae07921@windriver.com>
In-Reply-To: <f8d5d7c8-4f93-461f-a6d2-4840cae07921@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Jan 2026 09:13:17 -0500
X-Gm-Features: AZwV_QhJ2E0OGmes_pWqydSBkYBW4LPR8LOp1pCtiadBUt14lN1iiwcKiUHZHX0
Message-ID: <CADkTA4PxtkH0qHe=UyMwUskv39tc4ztYa_h=o_t58y8=QMJHmQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 00/15] set go buildid to empty for
 improving reproducibility
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000599a55064859b6e1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Jan 2026 14:13:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9550

--000000000000599a55064859b6e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 12:05=E2=80=AFAM Changqing Li <changqing.li@windriv=
er.com>
wrote:

>
> On 1/8/26 21:21, Bruce Ashfield wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
> On Thu, Jan 8, 2026 at 1:26=E2=80=AFAM Changqing Li via lists.yoctoprojec=
t.org
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8Ev=
Q!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAF=
ZmCsF_sHzefcUMGHw_79Q$>
> <changqing.li
> <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!cbNtO-fT=
MjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHze=
fcUMuaHYLRg$>
> =3Dwindriver.com@lists.yoctoproject.org> wrote:
>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> These series of patches are mostly set buildid to empty for improving
>> reproducibility, I also send a patch to oe-core with subject:
>> [PATCH V3] go.bbclass: set buildid to empty string to improve
>> reproducibility
>>
>> which add -buildid=3D in default GO_LDFLAGS, but since packages compiled
>> with go may not use GO_LDFLAGS in go.bbclass, they can have their own
>> Makefiles, define their own variables for passing ldflags, so change
>> them one by one.
>>
>
> Rather than setting it to empty, I'd rather set it to a value that might
> be useful to us.
>
> Perhaps the git hash we are building ? or the checksum of another
> set of files ?
>
> Hi, Bruce
>
> The idea is good, for the recipes changed one by one in this series patch=
, maybe we can easily give them a value one by one.
>
> but for go.bbclass,  I have two ideas:
>
> GO_BUILDID ?=3D ' -buildid=3D"${@d.getVar('SRCREV') if d.getVar('SRCREV')=
 !=3D 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRCREV_%s'%=
${PN}) !=3D '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.getvarflag(=
'sha256sum') !=3D '' if () else '') )}'
>
> This is complicated, and theoretically speaking,  not sure it always have=
 a value. And do we really need this value,  how to use it?
>
> GO_BUILDID ?=3D ' -buildid=3Dd.getVar('PV')
>
> This can ensure it always have a value, but I think this is not very usef=
ul.  usually, we can get version by "binray --version".
>
>
>
It isn't about getting the version, it is about traceability in more of a
CI/CD type environment
(and even in our layers where I don't bump by version, but use git hashes
more often)

I view it similarly to the "latest" tag in containers. It is mainly useful
in development and CI type
environments, but at release real tags are used when doing a container.

So capturing something about the build that is traceable and reproducible
is my goal.  The
SRCREV of the recipe we are building is the obvious choice, even though it
is sometimes
captured in other places as well.

I don't mind your GO_BUILDID concept, even if it doesn't go to the main
bbclass, we could
test it in meta-virt.

Bruce



> Consider above, how about set it to empty if we don't have special usage =
of this buildid?
>
>
>
> //Sandy
>
>
>
> Bruce
>
>
>
>>
>> podman also disable buildvcs
>>
>> Changqing Li (15):
>>   docker-compose: set go buildid to empty for improving reproducibility
>>   docker: set go buildid to empty for improving reproducibility
>>   kubernetes: set go buildid to empty for improving reproducibility
>>   nerdctl: set go buildid to empty for improving reproducibility
>>   runc: set go buildid to empty for improving reproducibility
>>   skopeo: set go buildid to empty for improving reproducibility
>>   umoci: set go buildid to empty for improving reproducibility
>>   cni: update GO_EXTRA_LDFLAGS
>>   oci-image-tools: set go buildid to empty for improving reproducibility
>>   docker-distribution: set go buildid to empty for improving
>>     reproducibility
>>   containerd: set go buildid to empty for improving reproducibility
>>   cri-o: set go buildid to empty for improving reproducibility
>>   cri-tools: set go buildid to empty for improving reproducibility
>>   oci-runtime-tools: set go buildid to empty for improving
>>     reproducibility
>>   podman: improve reproducibility
>>
>>  .../containerd/containerd_git.bb
>> <https://urldefense.com/v3/__http://containerd_git.bb__;!!AjveYdw8EvQ!cb=
NtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCs=
F_sHzefcUNo9zLiWA$>
>>             |  1 +
>>  recipes-containers/cri-o/cri-o_git.bb
>> <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!cbNtO-f=
TMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHz=
efcUMs78D5Ig$>
>>        |  1 +
>>  recipes-containers/cri-tools/cri-tools_git.bb
>> <https://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8EvQ!cbN=
tO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF=
_sHzefcUMpCb2ntg$>
>> |  2 +-
>>  .../docker-compose/docker-compose_git.bb
>> <https://urldefense.com/v3/__http://docker-compose_git.bb__;!!AjveYdw8Ev=
Q!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAF=
ZmCsF_sHzefcUN5gCwGXw$>
>>     |  4 +-
>>  .../docker-distribution_git.bb
>> <https://urldefense.com/v3/__http://docker-distribution_git.bb__;!!AjveY=
dw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bj=
rQaAFZmCsF_sHzefcUPPOSTQ1A$>
>>               |  2 +
>>  ...01-Makefile-remove-duplicate-ldflags.patch | 39 +++++++++++++++++++
>>  recipes-containers/docker/docker.inc
>> <https://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!cbNtO-fTM=
jWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzef=
cUNwIT0NzQ$>
>>         |  2 +
>>  .../kubernetes/kubernetes_git.bb
>> <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!cb=
NtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCs=
F_sHzefcUOnhKFbpA$>
>>             |  2 +-
>>  recipes-containers/nerdctl/nerdctl_git.bb
>> <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!cbNtO=
-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_s=
HzefcUNO5-GgCA$>
>>    |  1 +
>>  .../0001-Makefile-add-EXTRA_LDFLAGS.patch     | 39 +++++++++++++++++++
>>  .../oci-image-tools/oci-image-tools_git.bb
>> <https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!AjveYdw8E=
vQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaA=
FZmCsF_sHzefcUPoEWN6-w$>
>>   |  5 ++-
>>  .../0001-Makefile-add-EXTRA_LDFLAGS.patch     | 33 ++++++++++++++++
>>  .../oci-runtime-tools_git.bb
>> <https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;!!AjveYdw=
8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQ=
aAFZmCsF_sHzefcUOHvuIx5g$>
>>                 |  2 +
>>  recipes-containers/podman/podman_git.bb
>> <https://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!cbNtO-=
fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sH=
zefcUN_RLh2RA$>
>>      |  4 +-
>>  recipes-containers/runc/runc.inc
>> <https://urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!cbNtO-fTMjW=
d2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcU=
N6fsNm5A$>
>>             |  1 +
>>  recipes-containers/skopeo/skopeo_git.bb
>> <https://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!cbNtO-=
fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sH=
zefcUPMeA_sbQ$>
>>      |  2 +-
>>  recipes-containers/umoci/umoci_git.bb
>> <https://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!cbNtO-f=
TMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHz=
efcUO9-Ps7rA$>
>>        |  4 +-
>>  recipes-networking/cni/cni_git.bb
>> <https://urldefense.com/v3/__http://cni_git.bb__;!!AjveYdw8EvQ!cbNtO-fTM=
jWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzef=
cUN-aL8Klg$>
>>            |  4 +-
>>  18 files changed, 138 insertions(+), 10 deletions(-)
>>  create mode 100644
>> recipes-containers/docker-distribution/files/0001-Makefile-remove-duplic=
ate-ldflags.patch
>>  create mode 100644
>> recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LDFLAGS=
.patch
>>  create mode 100644
>> recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_LDFLA=
GS.patch
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9531):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/9531
>> <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-virtu=
alization/message/9531__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpv=
LRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOR0VWQvA$>
>> Mute This Topic: https://lists.yoctoproject.org/mt/117148688/1050810
>> <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/117148688=
/1050810__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevO=
CeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUORBdhH5w$>
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
>> <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-virtu=
alization/unsub__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQf=
Xr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNro6bbiw$>
>> [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000599a55064859b6e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 14, 2026 at 12:05=
=E2=80=AFAM Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com">=
changqing.li@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><u></u>

 =20
  <div bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div>On 1/8/26 21:21, Bruce Ashfield wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <strong>
      </strong>
      <div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:=
rgb(252,252,3)"><strong><u></u><span style=3D"font-size:11pt;color:rgb(0,0,=
0)">CAUTION: This email
              comes from a non Wind River email account!</span><u></u></str=
ong><br>
        <u></u><span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click=
 links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        <u></u></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 8, 2026 at
              1:26=E2=80=AFAM Changqing Li via
              <a href=3D"https://urldefense.com/v3/__http://lists.yoctoproj=
ect.org__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOC=
eAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUMGHw_79Q$" target=3D"_blank">
                lists.yoctoproject.org</a> &lt;<a href=3D"https://urldefens=
e.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo=
_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUMuaHYLRg$" target=
=3D"_blank">changqing.li</a>=3D<a href=3D"mailto:windriver.com@lists.yoctop=
roject.org" target=3D"_blank">windriver.com@lists.yoctoproject.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriv=
er.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
              <br>
              These series of patches are mostly set buildid to empty
              for improving<br>
              reproducibility, I also send a patch to oe-core with
              subject: <br>
              [PATCH V3] go.bbclass: set buildid to empty string to
              improve reproducibility<br>
              <br>
              which add -buildid=3D in default GO_LDFLAGS, but since
              packages compiled<br>
              with go may not use GO_LDFLAGS in go.bbclass, they can
              have their own<br>
              Makefiles, define their own variables for passing ldflags,
              so change<br>
              them one by one.<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div style=3D"font-size:small">Rather
                than setting it to empty, I&#39;d rather set it to a value
                that might</div>
              <div style=3D"font-size:small">be
                useful to us.</div>
              <div style=3D"font-size:small"><br>
              </div>
              <div style=3D"font-size:small">Perhaps
                the git hash we are building ? or the checksum of
                another</div>
              <div style=3D"font-size:small">set of
                files ?</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <pre>Hi, Bruce

The idea is good, for the recipes changed one by one in this series patch, =
maybe we can easily give them a value one by one.=20

but for go.bbclass,  I have two ideas:=20

GO_BUILDID ?=3D &#39; -buildid=3D&quot;${@d.getVar(&#39;SRCREV&#39;) if d.g=
etVar(&#39;SRCREV&#39;) !=3D &#39;INVALID&#39; else ( d.getVar(&#39;SRCREV_=
%s&#39;%${PN}) if d.getVar(&#39;SRCREV_%s&#39;%${PN}) !=3D &#39;&#39; else =
( d.getVarFlag(&#39;SRC_URI&#39;, &#39;sha256sum&#39;) if d.getvarflag(&#39=
;sha256sum&#39;) !=3D &#39;&#39; if () else &#39;&#39;) )}&#39;

This is complicated, and <span lang=3D"en"><span><span>theoretically speaki=
ng,  </span></span></span>not sure it always have a value. And do we really=
 need this value,  how to use it?

GO_BUILDID ?=3D &#39; -buildid=3Dd.getVar(&#39;PV&#39;)

This can ensure it always have a value, but I think this is not very useful=
.  usually, we can get version by &quot;binray --version&quot;.=20

</pre></div></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">It isn&#39;t about getting the version, it is abou=
t traceability in more of a CI/CD type environment</div><div class=3D"gmail=
_default" style=3D"font-size:small">(and even in our layers where I don&#39=
;t bump by version, but use git hashes more often)</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">I view it similarly to the &quot;latest&quot; tag=
 in containers. It is mainly useful in development and CI type</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">environments, but at releas=
e real tags are used when doing a container.<br><br>So capturing something =
about the build that is traceable and reproducible is my goal.=C2=A0 The</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">SRCREV of the rec=
ipe we are building is the obvious choice, even though it is sometimes</div=
><div class=3D"gmail_default" style=3D"font-size:small">captured in other p=
laces as well.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">I don&#39;=
t mind your GO_BUILDID concept, even if it doesn&#39;t go to the main bbcla=
ss, we could</div><div class=3D"gmail_default" style=3D"font-size:small">te=
st it in meta-virt.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce=
</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div bgcolor=3D"#ffffff"><pre>Consider above, how about set it to e=
mpty if we don&#39;t have special usage of this buildid?=20



//Sandy

</pre>
    <p></p>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>
              <div style=3D"font-size:small"><br>
              </div>
              <div style=3D"font-size:small">Bruce</div>
              <br>
            </div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              podman also disable buildvcs<br>
              <br>
              Changqing Li (15):<br>
              =C2=A0 docker-compose: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 docker: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 kubernetes: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 nerdctl: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 runc: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 skopeo: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 umoci: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 cni: update GO_EXTRA_LDFLAGS<br>
              =C2=A0 oci-image-tools: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 docker-distribution: set go buildid to empty for
              improving<br>
              =C2=A0 =C2=A0 reproducibility<br>
              =C2=A0 containerd: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 cri-o: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 cri-tools: set go buildid to empty for improving
              reproducibility<br>
              =C2=A0 oci-runtime-tools: set go buildid to empty for improvi=
ng<br>
              =C2=A0 =C2=A0 reproducibility<br>
              =C2=A0 podman: improve reproducibility<br>
              <br>
              =C2=A0.../containerd/<a href=3D"https://urldefense.com/v3/__h=
ttp://containerd_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqp=
vLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNo9zLiWA$" rel=3D"norefe=
rrer" target=3D"_blank">containerd_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
              =C2=A0recipes-containers/cri-o/<a href=3D"https://urldefense.=
com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_F=
Y3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUMs78D5Ig$" rel=3D"n=
oreferrer" target=3D"_blank">cri-o_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
              =C2=A0recipes-containers/cri-tools/<a href=3D"https://urldefe=
nse.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAi=
e15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUMpCb2ntg$" =
rel=3D"noreferrer" target=3D"_blank">cri-tools_git.bb</a>
              |=C2=A0 2 +-<br>
              =C2=A0.../docker-compose/<a href=3D"https://urldefense.com/v3=
/__http://docker-compose_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dD=
o_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN5gCwGXw$" rel=
=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
              =C2=A0.../<a href=3D"https://urldefense.com/v3/__http://docke=
r-distribution_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvL=
RTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUPPOSTQ1A$" rel=3D"noreferr=
er" target=3D"_blank">docker-distribution_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<=
br>
              =C2=A0...01-Makefile-remove-duplicate-ldflags.patch | 39
              +++++++++++++++++++<br>
              =C2=A0recipes-containers/docker/<a href=3D"https://urldefense=
.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY=
3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNwIT0NzQ$" target=3D=
"_blank">docker.inc</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
              =C2=A0.../kubernetes/<a href=3D"https://urldefense.com/v3/__h=
ttp://kubernetes_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqp=
vLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOnhKFbpA$" rel=3D"norefe=
rrer" target=3D"_blank">kubernetes_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
              =C2=A0recipes-containers/nerdctl/<a href=3D"https://urldefens=
e.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15d=
Do_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNO5-GgCA$" rel=
=3D"noreferrer" target=3D"_blank">nerdctl_git.bb</a>=C2=A0
              =C2=A0 =C2=A0|=C2=A0 1 +<br>
              =C2=A0.../0001-Makefile-add-EXTRA_LDFLAGS.patch=C2=A0 =C2=A0 =
=C2=A0| 39
              +++++++++++++++++++<br>
              =C2=A0.../oci-image-tools/<a href=3D"https://urldefense.com/v=
3/__http://oci-image-tools_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15=
dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUPoEWN6-w$" rel=
=3D"noreferrer" target=3D"_blank">oci-image-tools_git.bb</a>=C2=A0
              =C2=A0 |=C2=A0 5 ++-<br>
              =C2=A0.../0001-Makefile-add-EXTRA_LDFLAGS.patch=C2=A0 =C2=A0 =
=C2=A0| 33
              ++++++++++++++++<br>
              =C2=A0.../<a href=3D"https://urldefense.com/v3/__http://oci-r=
untime-tools_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRT=
vvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOHvuIx5g$" rel=3D"noreferrer=
" target=3D"_blank">oci-runtime-tools_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +<br>
              =C2=A0recipes-containers/podman/<a href=3D"https://urldefense=
.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo=
_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN_RLh2RA$" rel=3D=
"noreferrer" target=3D"_blank">podman_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
              =C2=A0recipes-containers/runc/<a href=3D"https://urldefense.c=
om/v3/__http://runc.inc__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqp=
vLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN6fsNm5A$" target=3D"_bl=
ank">runc.inc</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1=
 +<br>
              =C2=A0recipes-containers/skopeo/<a href=3D"https://urldefense=
.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo=
_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUPMeA_sbQ$" rel=3D=
"noreferrer" target=3D"_blank">skopeo_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
              =C2=A0recipes-containers/umoci/<a href=3D"https://urldefense.=
com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_F=
Y3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUO9-Ps7rA$" rel=3D"n=
oreferrer" target=3D"_blank">umoci_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
              =C2=A0recipes-networking/cni/<a href=3D"https://urldefense.co=
m/v3/__http://cni_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nq=
pvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN-aL8Klg$" rel=3D"noref=
errer" target=3D"_blank">cni_git.bb</a>=C2=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
              =C2=A018 files changed, 138 insertions(+), 10 deletions(-)<br=
>
              =C2=A0create mode 100644
recipes-containers/docker-distribution/files/0001-Makefile-remove-duplicate=
-ldflags.patch<br>
              =C2=A0create mode 100644
recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.pa=
tch<br>
              =C2=A0create mode 100644
recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.=
patch<br>
              <br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#9531): <a href=3D"https://urldefense.com/=
v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9531__;!!=
AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTr=
JW6bjrQaAFZmCsF_sHzefcUOR0VWQvA$" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9531</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.yoctoproject.org/mt/117148688/1050810__;!!AjveYdw8EvQ!cbNtO-fTMjWd=
2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUO=
RBdhH5w$" rel=3D"noreferrer" target=3D"_blank">
                https://lists.yoctoproject.org/mt/117148688/1050810</a><br>
              Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!cbNtO-fTM=
jWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzef=
cUNro6bbiw$" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000599a55064859b6e1--

