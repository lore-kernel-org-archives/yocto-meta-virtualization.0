Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2794CC2A069
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 05:20:31 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38517.1767504028610880149
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Jan 2026 21:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JMXA1ebK;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c27d14559so10386661a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Jan 2026 21:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767504028; x=1768108828; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJu5cFGHO/p5DK07nte9hLcVVhmLz8S6Ofa1qfjyrrw=;
        b=JMXA1ebKn4JlvbgVSu8js4v6+M2RYDJyTBXtx54Su04PLV53W+/eqCL48TX3oiyDtC
         Sbcz1gRJK/vi7BOWyuwsH0B3AHkBBJfISeIEnhY0DejVRZ1TpN1i53KU4dDyhvffMugZ
         5mCQzzDVGaSj/N1yZ5ZqG2k/VqBbLxY5O3Dm3LwFlJqQms++/FrYxPTKPB3i/Q/sZ1vF
         aIjTnVcMckGlD+W0xyoAfiGLRqzgAhrk+YmDQVAI5kXypXRMdgHXErqP5U0u4Tbb+qYI
         Rxmk42xYY3KO++mvh3jsrBh/NIOjnbvJJ2bEabIze0ComqmNr21mS+mTgPlFLll9+xpy
         ud4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767504028; x=1768108828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJu5cFGHO/p5DK07nte9hLcVVhmLz8S6Ofa1qfjyrrw=;
        b=BefxrHzqMrNcfg7NJxHoAtudfK3WVuvR1lWnmUtYFabVcOp64+57A3Zfh+PbuNdjRj
         V0q5qOhT1VZntHkvOEnAWZi3h2oK2v6SWY0l2mXjPImmtOoV6+1KylZJ5Tr64CH7Iq9r
         mi+JPfFWwRUIsoZD/mMTUmpnqGPSAzkHV5eBcruVvoj6VQDQu8+k+RG3K/2lqcgr2Agh
         Vdqz61XeRELH7Qylermw8eXUSTd/yLb42gwYuCPYBwriE3Bz2UR1X1HYGMf42A8zfqrk
         46DSV1yZqlQj5Q0Ng2W4R9PvDpem3TqR8OhBKlzzv4n7cTuTOqkKena+InElOir9tBaK
         /p+A==
X-Gm-Message-State: AOJu0Yz+5DARpfHazQK39R3B6Xp9j0LVP8OaQEQ0RRyFtJOSXS2ZAuR7
	KwJT5vsW2dB5yIXKcc1FujL/Y3aTZN+whVbLhLS/bnbWaP3/K84nrx+oxxNCcP9H0OKWRUuBjwF
	AQLcnRZpbBTWNP5ePPAhgbG57VHHBMYA=
X-Gm-Gg: AY/fxX6v15dyA5tN85OlTlpRh4hvZACsHhPdpSCEvmsesMZdpAdyRVvuExdpQJqpxZd
	4iWDOnIEnug237qwH7DTywrJa1owe80gmbfjXSsqe0bQyhMFxEVDqdrlfGeNpg+1V6GruOaYvqN
	ZfN+TQUBm5joaB6J5qD1NBVB5HrcDNXbUsQx2BkFIKGIdK4wncKUj1DNT1EPei7+TOTS1h8JJ0b
	r+Dqfs8vwp1jDjpkG6Pgpa+w8zJ+R2TXOkUzfOtFisLmBGGQPRTSmF1Ko3/6x2Zc0ifbyX0
X-Google-Smtp-Source: AGHT+IF+VQjonAfiQ4JMQ3EmqjoUomrP7HeqHf0AIcY5BZuRrH65X2TNG9ZxhQplVztE2m48oNNAmnNCJCt9BbtuFek=
X-Received: by 2002:a17:90b:568d:b0:34e:630c:616c with SMTP id
 98e67ed59e1d1-34e921e74ebmr36331298a91.31.1767504027747; Sat, 03 Jan 2026
 21:20:27 -0800 (PST)
MIME-Version: 1.0
References: <CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <1885E2DCAB6244C8.1706869@lists.yoctoproject.org> <CADkTA4OS8wGT5VG=uBpybZamkSWk4Mxv9ReUaGt2t3q8J80D5A@mail.gmail.com>
 <b107ec79-2ef6-4e60-8af8-bcc97d30b12c@windriver.com>
In-Reply-To: <b107ec79-2ef6-4e60-8af8-bcc97d30b12c@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 4 Jan 2026 00:20:16 -0500
X-Gm-Features: AQt7F2oCKrka9ozFMwnnVBKtWDfpvD_R-RysotbMxmz32VrVakJaF0sTgOwQCeA
Message-ID: <CADkTA4PaCMo84a4YTzoXvt9dWf5gFCwTMvkjjVdBnWiZSOSejA@mail.gmail.com>
Subject: Re: [meta-virtualization] Issues with the new go-mod-vcs
To: ChenQi <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Jan 2026 05:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9514

On Sat, Jan 3, 2026 at 11:44=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wrot=
e:
>
> Hi Bruce,
>
> Thanks a lot for your prompt response and efforts.
>
> The BB_GIT_SHALLOW_EXTRA_REFS is the only one that actually breaks build.
> Switching to the tag parameter looks like a good approach.
> In case you want to check if things work for that new approach:
> 1. Add in local.conf:
> BB_GENERATE_SHALLOW_TARBALLS =3D "1"
> BB_GIT_SHALLOW =3D "1"
> 2. bitbake cni -c fetch

I have updates to the hybrid fetcher (it was missing some
de-duplication logic that
is part of the go fetcher), and regenerations to all the recipes completed.

The recipes all have BB_GIT_SHALLOW =3D "1" now (for testing), and use tag=
=3D
when the discovery hasn't "unshallowed" a clone and the reference is a tag.

shallow=3D1 is still in the src_uri entries, as I mentioned it is an
indication of intent
that I'm going to leverage in the future. It simply means, the
go-mod-vcs process
thinks that this repository will work in shallow mode.

Cheers,

Bruce

>
> Regards,
> Qi
>
> On 12/30/25 20:33, Bruce Ashfield wrote:
>
>
>
> On Tue, Dec 30, 2025 at 12:11=E2=80=AFAM Bruce Ashfield via lists.yoctopr=
oject.org <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>>
>>
>> On Mon, Dec 29, 2025 at 11:23=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com=
> wrote:
>>>
>>> Hi Bruce,
>>>
>>>
>>>
>>> The new go-mod-vcs recently introduced in meta-virt  has some some prob=
lems.
>>>
>>>
>>>
>>> The first and most significant one is the misuse of BB_GIT_SHALLOW_EXTR=
A_REFS. It causes fetching failure when shallow tarball generation is enabl=
ed.
>>
>>
>> I wouldn't call it a misuse, it is actually required to make the support=
 work
>> and attempt to save some download space. There are thousands of dependen=
cies
>> for some of the recipes and MANY of them have tags that aren't on branch=
es, or
>> aren't at the tip of branches, so those refs are there to force a deep e=
nough fetch
>> or to ensure that bitbake does the same "deshallowing"  as was done duri=
ng
>> generation.
>>
>> I could probably switch it out for tag=3D in the different entries. I've=
 made that
>> tweak and will run some tests.
>>
>>
>>>
>>> Use the following steps to reproduce the error:
>>>
>>> Add in local.conf:
>>>
>>> BB_GENERATE_SHALLOW_TARBALLS =3D "1"
>>>
>>> BB_GIT_SHALLOW =3D "1"
>>>
>>> bitbake cni -c fetch
>>>
>>>
>>>
>>> Error message: fatal: couldn't find remote ref v0.0.4
>>>
>>> Root cause: the repos specified in SRC_URI does not contain the require=
d extra refs specified by BB_GIT_SHALLOW_EXTRA_REFS.
>>
>> I run with that all the time, I've never seen it, those BB_GIT_SHALLOW_E=
XTRA_REFS are
>> not magic, they come directly from the repositories during discovery and=
 are required to deshallow
>> a repository.
>>
>> My tests with the tag parameter may solve the issue. So stay tuned, I ha=
ve that and several other
>> changes pending. But none of them will be until the end of next week onc=
e I am back in the office.
>>
>>>
>>>
>>>
>>> The second one is the duplicate entries in SRC_URI. Example: errdefs in=
 docker-compose.
>>>
>>>
>>
>>
>> It builds fine here, what issues are you seeing with it ? Are you using =
VCS
>> mode ? or hybrid ?
>
>
> There are multiple places that the vcs generator looks for (and removes d=
uplicates).
> I added another and am testing it. So once I fix the shallow clone logic,=
 I can push
> this as well.
>
> I was able to build both modes locally, so it is a cosmetic fix, but wort=
h doing.
>
> Cheers,
>
> Bruce
>
>
>>
>>
>> You can be assured that anything I pushed has been built many times, and=
 has
>> been runtime tested. So the first information you need to provide is mor=
e details
>> about what you are building, so I can track down the differences.
>>
>>>
>>> The third one is the =E2=80=98shallow=3D1=E2=80=99 parameter in SRC_URI=
. The problem is that git fetcher does not support such parameter.
>>>
>>> In fetch2/git.py: ud.shallow =3D d.getVar("BB_GIT_SHALLOW") =3D=3D "1"
>>>
>>> So I guess these could be removed? And switching to use BB_GIT_SHALLOW:=
pn-xxx =3D =E2=80=9C1=E2=80=9D?
>>
>>
>> No. I plan to add more support for that later, it just isn't ready yet. =
They will stay.
>>
>>>
>>>
>>> P.S.
>>>
>>> I sent a related patch to bitbake: https://lists.openembedded.org/g/bit=
bake-devel/message/18656
>>>
>>> The problem in bitbake is revealed by the current SRC_URI settings in m=
eta-virt.
>>>
>>> If you get similar error, you can apply the above patch.
>>
>>
>> If I was going to see that error, I would have already ...
>>
>> Bruce
>>
>>
>>>
>>>
>>>
>>> Regards,
>>>
>>> Qi
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9511): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/9511
>> Mute This Topic: https://lists.yoctoproject.org/mt/116993898/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

