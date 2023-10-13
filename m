Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B848FCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 14:03:20 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.39188.1697205795350149777
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 07:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iJ6gLHQK;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50325ce89e9so2916762e87.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697205793; x=1697810593; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTkdAiPyjXOPcvDT6SuvgMR59PZdqbb12y2TqWrU904=;
        b=iJ6gLHQKZ4xomhKqaBptUwXJQeIsCtmNWI2iYywdKawxy5dWdc+81G10QO2EwWe803
         osR92fCB3glJA1YI7sYpaods3xtwn10g2yEBnK4RPyMrjnT9Hjs33/u4dGoMz9ClTJIV
         nPvYYlQUp1jx1cSR4q14lDdyS3VixT+UgqAxjxNu7Ni4GVViMvNRtubadPui6PaUynHn
         toNxtCEbo6u5PRebl+BzGVw5K48i88kxaIm+5TjKM7F3WZgzdf4pPQL4P5L+KzrEnNKT
         snp4ntHmfB2Vo4X78neN3MsbUdOL9POpxNgVgJL9sh/VoERgDI+ohK0Nb2G2G5mwhZLc
         vuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697205793; x=1697810593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTkdAiPyjXOPcvDT6SuvgMR59PZdqbb12y2TqWrU904=;
        b=Dx025ma15o7gOKBfvO7NWDmKclHTVUyO8UL4x/MGPPOoVJZv8axxCl4Q5+q5RRWItT
         56AAWlKvOITNTf67yl3chdIBFTIUlSRvHvtH1I1Cclp13hAua2q5nLfbN+nSYAoumDi6
         t9fuUxl82SsNtRmSAcuFdxkKIwx/zZcRh/1rB19i+L1NbZcE9lDtcC9SXWlUugNIu/Fo
         X7moRZWfWgWBc8fdSyw8q/qdGZwQgi0W6stNxDdzor8oyK/1GU5ALQX8vG6DU1rfn6ad
         6zMM1QOWxFtOErQ2tCUo9vlVVXAZXxjnBc14P+t/3/r/7mZzW91AK0CmSPrdFcivK3Aq
         Os0A==
X-Gm-Message-State: AOJu0YyZx8BT9dcDOAuw20pvnPLWUVUac8OYjjLDZ0Q2SpwOy3TDQw31
	Ucq4ZjPQnLCeKjex8u5l1XjACk+YiLMjiZJb9q4=
X-Google-Smtp-Source: AGHT+IFVTlSUwZlycbqTrVnj1XyyJWuLUHnGYudVnD1rpMq6EN0nXkwL8/nE073eaOcvF4ytkIVmFgMLjxi+sUW7M6U=
X-Received: by 2002:a05:6512:3706:b0:503:367c:49c7 with SMTP id
 z6-20020a056512370600b00503367c49c7mr19837474lfr.53.1697205792985; Fri, 13
 Oct 2023 07:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231012165156.357269-1-JPEWhacker@gmail.com> <178D6BFFDDF3349D.29357@lists.yoctoproject.org>
 <CADkTA4PAnZabpi8Hz-maV6fb9Mm0VnucUrHiX+42K5dkaYbQWw@mail.gmail.com>
 <CAJdd5GaDk3kvnNmO4G6NfxkBjKVaWUBrkbRdd1OAS_YSOH261Q@mail.gmail.com>
 <CADkTA4PNKo9XAPzJ4qQVCbtOh-ZXU2C1MXztYH1c7U4d-UWLnQ@mail.gmail.com>
 <CAJdd5GYT5Wzpy8rQnKx3-=0XEDBspqWZbE2et14VkJ6io+z_QA@mail.gmail.com>
 <178D8BCB6046F019.14388@lists.yoctoproject.org> <CADkTA4OR61ZYbTyGpzk2_8v3gJcbR=6O1VYEa4M61Byo4dToUw@mail.gmail.com>
In-Reply-To: <CADkTA4OR61ZYbTyGpzk2_8v3gJcbR=6O1VYEa4M61Byo4dToUw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 13 Oct 2023 08:03:01 -0600
Message-ID: <CAJdd5GZRFLmzE0WrXcjGNRk361va0WooF4MWczVYMaZEY8F01w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci: Add OCI_IMAGE_ENTRYPOINT_ARG_LIST
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 14:03:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8361

On Thu, Oct 12, 2023 at 9:40=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
>
>
> On Thu, Oct 12, 2023 at 11:05=E2=80=AFPM Bruce Ashfield via lists.yoctopr=
oject.org <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>>
>>
>> On Thu, Oct 12, 2023 at 7:02=E2=80=AFPM Joshua Watt <jpewhacker@gmail.co=
m> wrote:
>>>
>>>
>>>
>>> On Thu, Oct 12, 2023, 4:39 PM Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
>>>>
>>>>
>>>>
>>>> On Thu, Oct 12, 2023 at 6:09=E2=80=AFPM Joshua Watt <jpewhacker@gmail.=
com> wrote:
>>>>>
>>>>> On Thu, Oct 12, 2023 at 11:25=E2=80=AFAM Bruce Ashfield
>>>>> <bruce.ashfield@gmail.com> wrote:
>>>>> >
>>>>> >
>>>>> >
>>>>> > On Thu, Oct 12, 2023 at 1:23=E2=80=AFPM Bruce Ashfield via lists.yo=
ctoproject.org <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>> >>
>>>>> >>
>>>>> >>
>>>>> >> On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM Joshua Watt <JPEWhacker@g=
mail.com> wrote:
>>>>> >>>
>>>>> >>> The "entrypoint arguments" (command) is allowed to be a list of
>>>>> >>> arguments to pass to the entrypoint. However, the current
>>>>> >>> OCI_IMAGE_ENTRYPOINT_ARGS variables doesn't support however. In o=
rder to
>>>>> >>> maintain backward compatibility, a new variable has to be introdu=
ced to
>>>>> >>> that can be split into the multiple arguments required
>>>>> >>>
>>>>> >>
>>>>> >> I haven't looked in detail, but the original intent of that variab=
le IS to have more than
>>>>> >> one argument. I was just the only current user of them, and only h=
ad one argument
>>>>> >> that needed to be passed.
>>>>> >>
>>>>> >> I'd rather not have a new variable, but just change the processing=
 to do 1 or more
>>>>> >> arguments in the existing variable.
>>>>> >>
>>>>> >
>>>>> > Which if I'm not mistaken, is your first patch :)
>>>>>
>>>>> Almost. The first patch does it for OCI_IMAGE_ENTRYPOINT. That one is
>>>>> straight forward because there is no backward compatible problem. The
>>>>> second one (this one) does it for
>>>>> OCI_IMAGE_ENTRYPOINT_ARGS, which is trickier because if we make it
>>>>> behave the same as OCI_IMAGE_ENTRYPOINT it will break anyone who is
>>>>> currently relying on a space in OCI_IMAGE_ENTRYPOINT_ARGS to be passe=
d
>>>>> verbatim to their entrypoint (hence my tentative suggestion to add a
>>>>> new variable). I'd be fine with just make OCI_IMAGE_ENTRYPOINT_ARGS
>>>>> split on space if that was the original intention (I can even roll it
>>>>> into the previous patch if you want and make it do both variables at
>>>>> the same time).
>>>>
>>>>
>>>> That's sort of my point.
>>>>
>>>> The entry point can just be the executable, and this variable is suppo=
sed to be the arguments.
>>>>
>>>> So no arguments should be passed via that first variable, but should b=
e in this one. We can have the split and processing here, and check and for=
bid it in the first variable. It shouldn't be in both.
>>>
>>>
>>> I've made plenty of container images where ENTRYPOINT had multiple argu=
ments; the trivial example is ["/usr/bin/python3", "my script"]. Sure, you =
can do it other ways (e.g. a proxy shell script.... Which then means your c=
ontainer needs a shell), but restricting that as an option doesn't seem nec=
essary?
>>>
>>
>> Sure, but I'm saying put that "my script" in the args variable, that's e=
xactly what I added it for.
>>
>
> I should clarify that I mean that we don't have to process it via the con=
fig.cmd for umoci
> .. if there's a technical need to change how it is encoded, we can deal w=
ith that. i.e in
> theory that variable could just be turned into multiple config.entrypoint=
 calls instead of
> config.cmd
>
> But both ways of encoding it work (entrypoint + cmd), and there's no need=
 to
> complicate things by adding another variable, we should be able to expres=
s what
> we need with the existing ones.
>
> The umoci and image-spec tests that I've run use entrypoint + cmd to enco=
de arguments
> to the main executable / interpreter. We can sit around and talk about ho=
w we are reading
> the oci-image-spec, but both entrypoint and cmd are optional in it (the s=
pec), and have a
> similar function.  I've seen both ways of encoding in various container s=
tacks over
> the years.
>
> But in the end, I don't think it matters at all. With umoci, it is valid =
to encode them either
> way, so simply converting space separated entrypoints and arguments to re=
peated
> --config.entrypoint and --config.cmd calls are fine, and we don't have to=
 worry about
> backward compatibility now that I've looked at things more closely.
>
> If someone wants a single entrypoint and options via cmd, they can do tha=
t with them
> both converted, and vice versa.

Got it. I think I understand now. I'll send a patch.

>
> Bruce
>
>
>>
>> Bruce
>>
>>
>>>
>>>
>>>>
>>>> Bruce
>>>>
>>>>>
>>>>>
>>>>> >
>>>>> > Bruce
>>>>> >
>>>>> >
>>>>> >>
>>>>> >> I'll also have to figure out how to make the sloci backend work, b=
ut that's a different
>>>>> >> question.
>>>>> >>
>>>>> >> Bruce
>>>>> >>
>>>>> >>
>>>>> >>>
>>>>> >>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>>>> >>> ---
>>>>> >>>  classes/image-oci-umoci.inc | 3 +++
>>>>> >>>  classes/image-oci.bbclass   | 1 +
>>>>> >>>  2 files changed, 4 insertions(+)
>>>>> >>>
>>>>> >>> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoc=
i.inc
>>>>> >>> index 6c7f244..da93570 100644
>>>>> >>> --- a/classes/image-oci-umoci.inc
>>>>> >>> +++ b/classes/image-oci-umoci.inc
>>>>> >>> @@ -103,6 +103,9 @@ IMAGE_CMD:oci() {
>>>>> >>>      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
>>>>> >>>         umoci config --image $image_name:${OCI_IMAGE_TAG} --confi=
g.cmd "${OCI_IMAGE_ENTRYPOINT_ARGS}"
>>>>> >>>      fi
>>>>> >>> +    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARG_LIST}" ]; then
>>>>> >>> +       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@" ".=
join("--config.cmd %s" % s for s in d.getVar("OCI_IMAGE_ENTRYPOINT_ARG_LIST=
").split())}
>>>>> >>> +    fi
>>>>> >>>      umoci config --image $image_name:${OCI_IMAGE_TAG} --author $=
{OCI_IMAGE_AUTHOR_EMAIL}
>>>>> >>>
>>>>> >>>      # make a tar version of the image direcotry
>>>>> >>> diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclas=
s
>>>>> >>> index 9ddb88b..68045ad 100644
>>>>> >>> --- a/classes/image-oci.bbclass
>>>>> >>> +++ b/classes/image-oci.bbclass
>>>>> >>> @@ -57,6 +57,7 @@ OCI_IMAGE_SUBARCH ?=3D "${@oci_map_subarch(d.ge=
tVar('TARGET_ARCH'), d.getVar('TUNE
>>>>> >>>
>>>>> >>>  OCI_IMAGE_ENTRYPOINT ?=3D "sh"
>>>>> >>>  OCI_IMAGE_ENTRYPOINT_ARGS ?=3D ""
>>>>> >>> +OCI_IMAGE_ENTRYPOINT_ARG_LIST ?=3D""
>>>>> >>>  OCI_IMAGE_WORKINGDIR ?=3D ""
>>>>> >>>  OCI_IMAGE_STOPSIGNAL ?=3D ""
>>>>> >>>
>>>>> >>> --
>>>>> >>> 2.34.1
>>>>> >>>
>>>>> >>>
>>>>> >>>
>>>>> >>>
>>>>> >>
>>>>> >>
>>>>> >> --
>>>>> >> - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at its end
>>>>> >> - "Use the force Harry" - Gandalf, Star Trek II
>>>>> >>
>>>>> >>
>>>>> >>
>>>>> >>
>>>>> >
>>>>> >
>>>>> > --
>>>>> > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it thee at its end
>>>>> > - "Use the force Harry" - Gandalf, Star Trek II
>>>>> >
>>>>
>>>>
>>>>
>>>> --
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>
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
>> View/Reply Online (#8359): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/8359
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

