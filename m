Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7672DCA1013
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 07:16:52 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.6831.1757315811969971569
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 00:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OI1rv2us;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-336d84b58edso40073771fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Sep 2025 00:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757315810; x=1757920610; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pziC18KESdDOEQtL0epUpSS7KjWtJKIYUokgjYY0GhM=;
        b=OI1rv2use6RBDiFMQNdwaRCwylnlloA+jkXgKAgrO2k7OtIQNKkwquecnpVNIVoSds
         +6JGmPxwMYwi+3ilfqCpQMWiBOxHknGl6en4xYEGOSwBWlDeYTWstfBqYiToCygio60z
         qssNl/Zyg+8cLIrZn/X2fFY+M/W3fl/rWbiJkExLZE4Cag37dcCqg0rLSmSJi/uhl7zE
         Xnd5gpPlhD19zhTW2e5Nd3dcIEjTuND3W9dkIj2kn8VgOnDJr6hQEqZeZPIWiCdud0Zq
         pdoUgCbC/agrAY4iitz5Qnbrt8oqWkRehwBbPmbbMj9fFuba+zUM8DwCbkTwPo8AlZ22
         JlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757315810; x=1757920610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pziC18KESdDOEQtL0epUpSS7KjWtJKIYUokgjYY0GhM=;
        b=mPfpj6l2Tnr1ejdCyqGHX7IeCJ5zscNG1xfbqazcU9t+FCVQ92B5yrtf94Wv0czg8J
         9C99H94bUN9F5n8LqylfAB7G3vRVYxow5LnVDh78eXSQWQCWZZLYkH8FvTAbLfJ2aVmg
         VgKw1GQ7qbHr0gK7nFEy0GdhfL4fQudnNT/LU9F7CbSBbPsGg8aiiZIY5mNDLpZdEJ0P
         vaQP3fDOs/14j9zzBJg4eRQX750VXgFFniEUsHKiyDajJTKfOxOW9jatPnnWKCTmEUty
         BhEoADRD2xrCbCcXFHpNYAwm3asKWYOXc2NnLJuynvBqFig99wp3AuQP33ZqCkVSqsZD
         4+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXe8+R7cv8MHRs5q9iMtu/SKQKB019Ovk06vmgZ6mtjpfRG7k7fFW36Kf7lBxd/VzuNkZ8XhzY9FpScD/95f/H/ckxF@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywc3M9HEGuIMJz4c/VwM/M7QFhH/jQDKqcHoUlK3+5UTmx+ZIuO
	HX1h7ZBhcG0+nUDNgghe3+oq9XWjD8aAgT5jLHcqKHY+8GUXvRWTQ/VaLhwzpW4GUeo=
X-Gm-Gg: ASbGncvGl5nXSeoCb7Ob+pOq5EAOykgna7MuRBS6GI4+sPwP7ykPGr2XMLyq7Bn7mAJ
	E/QS0SfTon3CHIANyCK3iCTVQFCD0OS3lNIyJbu4JaSFzsPNkr4qKC82lDeceiVoX4tzeOwe+CV
	clmmEjNZhTpzucAiy6vn64IBhicCRVfuATjcZjvvaFr/jNFG3Lts1Dziv9tGebP+b8hJkgPwfEU
	e6ADkLFh3GA37DH4BRWl5o5ANzaj3uMpTyQ6j9nMAZGhlvjlmZYBGjyWTeW4UADEg93MDJYx0pE
	y+W/TMR3Hc3uhe1ZlxeLzoPHTqkQR3cL+RAlbDnG1GYkgvRiXjoWM6vO8mci6yNU1MNY2yElww4
	KjePszOWH121XWN9QZXDrw7po4AkUv7wqGqfswEaHAxp056g6pn0MRjU=
X-Google-Smtp-Source: AGHT+IEnNZIVxmMb5KZCYYLLoKog0ZU2g3XybKadkUemuoPusbZjk+cgtjhqSPFjQ6uipOsae0Htyg==
X-Received: by 2002:a05:651c:19a8:b0:336:9cbd:2773 with SMTP id 38308e7fff4ca-33b53ac8938mr16503091fa.38.1757315809752;
        Mon, 08 Sep 2025 00:16:49 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c934besm31917991fa.24.2025.09.08.00.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:16:49 -0700 (PDT)
Date: Mon, 8 Sep 2025 10:16:47 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: bruce.ashfield@gmail.com
Cc: peter.kjellerstedt@axis.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] containerd: Remove leading "v"
 from PV
Message-ID: <aL6C3y52Dg1Rmwxa@nuoska>
References: <20250907105926.1650992-1-pkj@axis.com>
 <CADkTA4OnwS3Bxsfg6R2uEo6-9gpZSZTvaOHEWRvUbjLmxO6weA@mail.gmail.com>
 <CADkTA4NKwaetHMUvbRian4m1Po1CYTXb7V+avOW1Fwj-RWLnsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4NKwaetHMUvbRian4m1Po1CYTXb7V+avOW1Fwj-RWLnsw@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Sep 2025 07:16:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9381

Hi,

On Sun, Sep 07, 2025 at 04:19:17PM -0400, Bruce Ashfield via lists.yoctoproject.org wrote:
> On Sun, Sep 7, 2025 at 4:17 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> > On Sun, Sep 7, 2025 at 6:59 AM Peter Kjellerstedt via
> > lists.yoctoproject.org <peter.kjellerstedt=axis.com@lists.yoctoproject.org>
> > wrote:
> >
> >> The leading "v" in the version otherwise makes its way into, e.g., the
> >> SBOM.
> >>
> >> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >> ---
> >>
> >> There are another 30 recipes in meta-virtualization that have a leading
> >> "v" in their versions, but this is the only one of them that we use.
> >> I can send patches for the others as well if you want.
> >>
> >
> > No thanks, to any of them.
> >
> > The "v" isn't by mistake. I don't see any reason to remove it.
> >
> 
> What I mean by this, is that someone needs to tell me why SBOM
> is broken enough that it can't handle the "v", and what problems it
> causes in the SBOM.

At least CVE checking tooling can compare PV against version numbers
outside of yocto build environment which are often without
"v" prefix used by several projects in git tags. Same for the SW versions
reported by the tools in logs and/or command line.

I think the tools can handle "v" but different ways of reporting version
numbers break usecases if "v" is not used in all contexts like in CVE
reporting.

For example Debian doesn't report containerd versions with leading "v".

Cheers,

-Mikko

