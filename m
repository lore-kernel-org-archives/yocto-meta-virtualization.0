Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FEDC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 03:21:49 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.1863.1669778500089323228
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 19:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S3qKeh4B;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id z9so7592621ilu.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 19:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vN5mdQyMZhBvQ0q+dIqsDRMioJtDy5m4GVkUM026020=;
        b=S3qKeh4BTJ01srizt5pEo9mZeNKXc+/46V6WUuS/TLh4Ivvfcws+N5TTOdpXXm6qJO
         or/R7Ab+1tMeltYp5uuwSXdKWWmyeiY/izH/2Lwf2vfCk3i2FcLSrs+r0/40afEZDvLm
         SceRW8oWuxlbOpnUHx20EupeUkC8ers19GM5jx8LcKGCH+9fRKYLtG2/Ts39OG2HyS6E
         lQW6BDGRJWvmZ6ONIahKa7TV+bxw5FspF6dFV2XdLBNxaXG63g4FJ//DWsuFE2E+v4ii
         JUn4AYr6Gv8V80Y1tmspoClxPwCNV3+WdQ3LX7hKjvgAMivzpiLflJeHMc1MfL6ZCOcH
         cqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vN5mdQyMZhBvQ0q+dIqsDRMioJtDy5m4GVkUM026020=;
        b=DNxV5+Qm/t8AJpcQkkeZMfYL2ahfPpzRQY6TPC2Pm2sJyHQv+jUVvYmyWl3jAB505S
         H+zC+UEzrLyMUsCGzwohJPlMw8Vd1bRoQYIVrDPPjk8nVRRqgqfCiX0A7MTKfgN+92qZ
         ve0D9DL1UmlPttNgZB4BdGdVmvsk5Cm4OBr8JhHmJNXuO8StA8/ZACghnXdjAOohlznC
         VecjkCl7T2xS4mcHxUd5qgNMUIJYTrK/PauIRPj8UPgGACab9N9ai+ThNHlGDgCJosmz
         juApjcQBjUZ4ZGD1Py0O2ImeD/Pdrc4fLrDDaRyp5x0NGLX3BCTZf/R2qnONX7Hd2RLm
         QxjQ==
X-Gm-Message-State: ANoB5pkng0yNt/0u18jKeNQJvsf9P/RZQV/wyAsOW0sJKg+vARLHBYti
	Uutkwwqhm9nd+cEvh3VudKej4eKFqIH2KlsdlnQ=
X-Google-Smtp-Source: AA0mqf6qsfo2PqeY4RtBj35RXoNQzFVFBaSnDHtmVAGESf5ng4CrYwHsVydox3xe6EFISfUVQgFxl8A7iEFebKrOUlg=
X-Received: by 2002:a92:d7d0:0:b0:303:154e:333d with SMTP id
 g16-20020a92d7d0000000b00303154e333dmr5840401ilq.107.1669778499411; Tue, 29
 Nov 2022 19:21:39 -0800 (PST)
MIME-Version: 1.0
References: <CAL5F+o+wXUrREoX2N10ks3YDMmACex+xYi3d9XewTns==BntSw@mail.gmail.com>
In-Reply-To: <CAL5F+o+wXUrREoX2N10ks3YDMmACex+xYi3d9XewTns==BntSw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 Nov 2022 22:21:28 -0500
Message-ID: <CADkTA4MoryRn=OOOQL7j0BHkjrB5Tyd35T+=f9=AA7YOqfd32A@mail.gmail.com>
Subject: Re: [meta-virtualization] Backport Repo branch changes (master=>main)
 to Kirkstone branch
To: Anthony Davies <anthony.t.davies@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 03:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7708

Which recipes ?

I normally port all branch changes as far back as possible, but I may
have missed some.

Bruce

On Tue, Nov 29, 2022 at 7:19 PM Anthony Davies
<anthony.t.davies@gmail.com> wrote:
>
> Hi,
>
> Is it possible to backport these patches from master to kirkstone?
>
> I could do it but I am not confident about submitting patches via email.
>
> Regards,
>
> Tony Davies
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7705): https://lists.yoctoproject.org/g/meta-virtualization/message/7705
> Mute This Topic: https://lists.yoctoproject.org/mt/95348458/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

