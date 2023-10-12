Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45431CDB474
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 22:09:15 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.25566.1697148552972923379
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 15:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RDgeZyYc;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50337b43ee6so1993163e87.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 15:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697148551; x=1697753351; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2w/1gAsISCwVZT+r6JqrEPWFCOWrNRiFEE0+p2ZUdY=;
        b=RDgeZyYcKaUE7PpkQ+pqU7ZqkU9GXaQUnXbIhYR8ORq0Zgo+JHZrstPn8XlIW2u06E
         L1F6Tclov+Cbj3Ag0f90Xd01zVMYm9E82ha1H87lFvKxovhsri9iMHyXYsH/VW6dX+tN
         Aq7ORjR9QyLrZ2MyntkaH8QEGI+PVVGYjw8+hr0keW514ap5PHX61G/2hBWMpGX4QrJ9
         ClPNnWAld8qNoJQxWiEepT08Rvhr/9e5vwpdDC11dcNXNgCksmDP08lHsh1Qxi++t4NJ
         D9+QgesMRWQd4MhIaNG+UTnCfkazNioqH/SBptAMOdKIx5y22C5Udf4AnwcRLzBgfu3e
         hD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697148551; x=1697753351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2w/1gAsISCwVZT+r6JqrEPWFCOWrNRiFEE0+p2ZUdY=;
        b=KZetmE126TkyxabXuNV6OlmIL4AvDoXwagIHEl+ePJ6uTV2LBpq/Cf7KXHbPRcsCFD
         FAxAXYIPABRWsX9DJZRJC6SXsRI5KCccWPTfkIY/1lCtRl75dNExcaagpYqYRin9U1wK
         2jjdJll1gxAbgLktd8SfdB8BJyvLK6MJo8AXFexTbAG0ZCPYUxe5JnWyFymSmgLMlbFU
         37xc5knYV/yT/JqAyi72d8HgwT2IzI7MkVIUIEiEQhFhsRpJsP1s1RiI5BI7u3iLsmjX
         e2IylwRHl9AXRZFj9SVJpjIZSVZMuUPgNbNg/ZijCe9TURJ0AhreTlhn03mhjFzI8NId
         TTNA==
X-Gm-Message-State: AOJu0YwO+mTkVBuE3lAufRKF0CnlgET31ZkcXIzV/aV3UU/4NIfak3Fh
	WsVZ3pEFYde8MhM2j7oPDH1HeOtJQsU8nlUhQgQ=
X-Google-Smtp-Source: AGHT+IFTySRkcQmrdYNQTCEGQ4+S0738LsNprs+hREDRxBvNHmFoz4rA+qdMWZK+6hNl1RdVkHNXQCKkjv+fZiSPSLw=
X-Received: by 2002:a05:6512:114d:b0:500:79f7:1738 with SMTP id
 m13-20020a056512114d00b0050079f71738mr23409592lfg.17.1697148550680; Thu, 12
 Oct 2023 15:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231012165156.357269-1-JPEWhacker@gmail.com> <178D6BFFDDF3349D.29357@lists.yoctoproject.org>
 <CADkTA4PAnZabpi8Hz-maV6fb9Mm0VnucUrHiX+42K5dkaYbQWw@mail.gmail.com>
In-Reply-To: <CADkTA4PAnZabpi8Hz-maV6fb9Mm0VnucUrHiX+42K5dkaYbQWw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Oct 2023 16:08:58 -0600
Message-ID: <CAJdd5GaDk3kvnNmO4G6NfxkBjKVaWUBrkbRdd1OAS_YSOH261Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci: Add OCI_IMAGE_ENTRYPOINT_ARG_LIST
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 22:09:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8356

On Thu, Oct 12, 2023 at 11:25=E2=80=AFAM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
>
> On Thu, Oct 12, 2023 at 1:23=E2=80=AFPM Bruce Ashfield via lists.yoctopro=
ject.org <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>>
>>
>> On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.c=
om> wrote:
>>>
>>> The "entrypoint arguments" (command) is allowed to be a list of
>>> arguments to pass to the entrypoint. However, the current
>>> OCI_IMAGE_ENTRYPOINT_ARGS variables doesn't support however. In order t=
o
>>> maintain backward compatibility, a new variable has to be introduced to
>>> that can be split into the multiple arguments required
>>>
>>
>> I haven't looked in detail, but the original intent of that variable IS =
to have more than
>> one argument. I was just the only current user of them, and only had one=
 argument
>> that needed to be passed.
>>
>> I'd rather not have a new variable, but just change the processing to do=
 1 or more
>> arguments in the existing variable.
>>
>
> Which if I'm not mistaken, is your first patch :)

Almost. The first patch does it for OCI_IMAGE_ENTRYPOINT. That one is
straight forward because there is no backward compatible problem. The
second one (this one) does it for
OCI_IMAGE_ENTRYPOINT_ARGS, which is trickier because if we make it
behave the same as OCI_IMAGE_ENTRYPOINT it will break anyone who is
currently relying on a space in OCI_IMAGE_ENTRYPOINT_ARGS to be passed
verbatim to their entrypoint (hence my tentative suggestion to add a
new variable). I'd be fine with just make OCI_IMAGE_ENTRYPOINT_ARGS
split on space if that was the original intention (I can even roll it
into the previous patch if you want and make it do both variables at
the same time).

>
> Bruce
>
>
>>
>> I'll also have to figure out how to make the sloci backend work, but tha=
t's a different
>> question.
>>
>> Bruce
>>
>>
>>>
>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>> ---
>>>  classes/image-oci-umoci.inc | 3 +++
>>>  classes/image-oci.bbclass   | 1 +
>>>  2 files changed, 4 insertions(+)
>>>
>>> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
>>> index 6c7f244..da93570 100644
>>> --- a/classes/image-oci-umoci.inc
>>> +++ b/classes/image-oci-umoci.inc
>>> @@ -103,6 +103,9 @@ IMAGE_CMD:oci() {
>>>      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
>>>         umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd =
"${OCI_IMAGE_ENTRYPOINT_ARGS}"
>>>      fi
>>> +    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARG_LIST}" ]; then
>>> +       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@" ".join("=
--config.cmd %s" % s for s in d.getVar("OCI_IMAGE_ENTRYPOINT_ARG_LIST").spl=
it())}
>>> +    fi
>>>      umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_I=
MAGE_AUTHOR_EMAIL}
>>>
>>>      # make a tar version of the image direcotry
>>> diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
>>> index 9ddb88b..68045ad 100644
>>> --- a/classes/image-oci.bbclass
>>> +++ b/classes/image-oci.bbclass
>>> @@ -57,6 +57,7 @@ OCI_IMAGE_SUBARCH ?=3D "${@oci_map_subarch(d.getVar('=
TARGET_ARCH'), d.getVar('TUNE
>>>
>>>  OCI_IMAGE_ENTRYPOINT ?=3D "sh"
>>>  OCI_IMAGE_ENTRYPOINT_ARGS ?=3D ""
>>> +OCI_IMAGE_ENTRYPOINT_ARG_LIST ?=3D""
>>>  OCI_IMAGE_WORKINGDIR ?=3D ""
>>>  OCI_IMAGE_STOPSIGNAL ?=3D ""
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
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
>> View/Reply Online (#8354): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/8354
>> Mute This Topic: https://lists.yoctoproject.org/mt/101922305/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/=
6693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

