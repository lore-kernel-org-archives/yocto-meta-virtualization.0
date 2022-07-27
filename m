Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62FAC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 13:23:30 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web08.19811.1658928196814301827
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 06:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HTPntuQx;
 spf=pass (domain: gmail.com, ip: 209.85.210.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id
 a14-20020a0568300b8e00b0061c4e3eb52aso12876627otv.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gHGxobvFzNp+mvSzCZbQ04UTzU94GkhYKVONLjWzoPg=;
        b=HTPntuQxCfeAbEwSINXMczCQxTPqYfuqnfv/wjgxWqsISELA9BI4j3p1Yx4H7Ybq4D
         ATKRLvYmifb5HKk1CtUpCJv3YSRhueC6ZodZJKCR27uPJkm2QN0lHlnP1VQg8OO46liI
         RkonINXVjsK8GRHuoVfkBe4K2VUsnmqHGBIHxFkUCjNUfwKSlCn0V5+R56PyxkjGDSrn
         rdezJmc9iNf3XO0UwapmNHCId457MHeCLMg/AiZqPJ/a3dal4EG/ApcgLf9Kpo42JNTl
         442DmXWwHeVDgXhmhoPCG3wbFzk4dPiCZyA4CBhjhyULZiQ15cL6e1c9avvRyFRxNG/3
         Eb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gHGxobvFzNp+mvSzCZbQ04UTzU94GkhYKVONLjWzoPg=;
        b=jjLB2aNwj0IuqCeDKziDpcUNpeGxBbZAs+zrJ6soYiFTAMt/LZ7Q4rczwAxBDLrXbf
         +Nan8dEaavXtDM/9dgpcpLNoBG0OtP3SwhHxlC2v9QXCPjSKfHz6rIqE1YfymP9x9lpb
         m3i6gNr33vYjVPpT9CqWJM36p2ShtlE/oN3dDc9UeDiFaOryYwkqGibrrEzgSu8lOH8C
         7fJNd5ZDbIXCMHY4YZDS/uXt0CAJgpaAOwfUiAwvJAb+2BiLbt3VxU4Cq6YLh35jUXmd
         VNZN7dIfZS06URq5lYH+Q0Xuip9IxeWajOjsonHJ5atW28I3Gzfj3OtwDwRiNTbvGxS4
         wObg==
X-Gm-Message-State: AJIora8yN9H1QsrptzE40KjDOqc5Pgc5Xs7yTpzqtZLifNvjAMSG87r2
	RlyZHZ57WbblwaOKkoiaznszzKvTLbbtpqi+Gzg=
X-Google-Smtp-Source: 
 AGRyM1tLWp4dJDwSFgI14vsidja5AfDYx1Epdeo82W4iHPYsZCiGQChffXBC6t3/iefrwLoJCocMa59nRRC9EgbTbgw=
X-Received: by 2002:a05:6830:140d:b0:61c:989d:9dfe with SMTP id
 v13-20020a056830140d00b0061c989d9dfemr8244740otp.374.1658928195998; Wed, 27
 Jul 2022 06:23:15 -0700 (PDT)
MIME-Version: 1.0
References: 
 <DB6PR1001MB12853F1BAF372C822B3E8487FA979@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <DB6PR1001MB12853F1BAF372C822B3E8487FA979@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 Jul 2022 09:23:02 -0400
Message-ID: 
 <CADkTA4N1hy9W+j78XURdkhVZ0owz9XkCVFCueTUwR7YW+N5Geg@mail.gmail.com>
Subject: Re: [meta-virtualization] Workflow for updating the golang projects
To: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Jul 2022 13:23:30 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7477

On Wed, Jul 27, 2022 at 3:15 AM Vasileios Anagnostopoulos
<vasileios.anagnostopoulos@siemens.com> wrote:
>
> Hello Everyone,
>
>
>
> I was wondering what is the general workflow for updating the golang proj=
ects (e.g. k3s, nerdctl, etc)?

Right now, at least for the project / official branches, it is
something that I do in the M3 timeframe of the release :) Experience
has shown that I need to batch the dependencies, and do a significant
level of testing to get things functional.

I have some changes already queued on master-next, with more to come
in the upcoming weeks. I have a talk at Embedded Linux Europe that
uses the components as well, so that drives the timeline as well.

For smaller updates (i.e. CVEs, etc), then bumps of the individual
SRCREVs in the giant SRC_URI can be manually done, since they are more
contained. Larger updates can of course also be done like this, but
that is definitely more effort iterating the SRCREVs.

>
> In the mailing list, there was [a reference for a tool](https://lists.yoc=
toproject.org/g/meta-virtualization/message/7183?p=3D%2C%2C%2C20%2C0%2C0%2C=
0%3A%3ACreated%2C%2Ck3s%2C20%2C2%2C0%2C82714461), but I could not located i=
t. Is it still WIP or is it located somewhere that I did not notice ?
>

The script still exists, but is still just in my sandbox, it blew up
spectacularly when I implemented some site mapping for the golang
bits, which meant manual fixups and a day or two of work. Which meant,
I wouldn't have time to both release it and help folks fight through
issues (It really isn't great quality yet) .. so that and there's only
a general consensus on the approach to these types of recipes (some
other generation/update integrations were released, but I haven't
tried them  or had to close a look at them myself) .. and I didn't
want to confuse things more at the time those other efforts were
released.

I'm working through a K3S system level update right now, and have been
fixing more issues in the script and the recipe(s) .. with any luck,
the quality won't be so bad (and the curse words removed), once I'm
through that :P

Bruce

>
>
> Thank you in advance and kind regards,
>
>
>
> Vasileios
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7474): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7474
> Mute This Topic: https://lists.yoctoproject.org/mt/92644738/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

