Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.12028.1576683962416360876
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Dec 2019 07:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SAnenGt9;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id c26so2022932eds.8
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Dec 2019 07:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OspYcG3291aDkKOB6I2oSIjQytaWXpwvRSyzU74226o=;
        b=SAnenGt9M2bwkDQGGITWqVem/WJdM80lqucjw5VWaKONC85z2nqVbzYO6wp8FlwRVc
         Pb/rh9J+NDLmrQIVES03aQ4aDNd7bPN6Fw2r1Cgs//ShFb3q8MGnAroIOIqRLJFKX7Qx
         RtJVyjl6B7gLXb04bDqchRuHlbXMKBSrl3oR22AZnkeDCDTnbvB9XEiWnfoRhR8/pWnF
         Au4CM9hMq+Ev2H9BLy5H2HZHnXXiS9hw/yFaF7mSuCCDa7OhvHWJGCBR25cO2a8ZES87
         g9B95kCAg+O67zAwO93ABa04vEBj+uk50BeCAvqQ+U4iNrx09Jpgf50V896iOXbzJ8/e
         3JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OspYcG3291aDkKOB6I2oSIjQytaWXpwvRSyzU74226o=;
        b=j5+kufYT2yHEzHvMdykcdAAZnI56SzTtNDjy+eJbuesUJCuEQs4fX1PlsaRnIPN82b
         h7ViYGyIs5PTypPfvNGj0mGKxxhACZpgGApaUh3L0TCgtcl2ivcv2D4tQNNEnoTgZWF9
         bwoHjxYJ/Q7BSeueLgwgBOFUPjT3f1z4V3t+vUVcTWIHRBymnt5AmBPGler2pFry5E7n
         /N5Oia0O7iIT7x5ZExSaZHHVlChrEINgVahuSm8u9TRdC2LwQqSPfeYFMeuaBFzN8YFL
         SUaeB4ANzb5CyneLquhejdlWg7BEwO9tPc6ewYxgaU7DkAfrz/QDKadGX4+Cn9Nd8iEK
         jebw==
X-Gm-Message-State: APjAAAWbEk1PMpY2vFD7NPDSML9AucjYBGkD/xKrg9ihcB2SoqgZwrqx
	HNEua9ZrHtZHMcgDXwUoZNSLZz3uYX/ovoszmmI=
X-Google-Smtp-Source: APXvYqyqBSzLBZypJArXf/5kaqC90EhMI0blTOgqjJ2Mq5RYR3ExLnvyxHorQ0dMb4mlqWfozUEoKeKxboM4jFnYSl4=
X-Received: by 2002:a17:906:b208:: with SMTP id p8mr3405050ejz.191.1576683960833;
 Wed, 18 Dec 2019 07:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20191216211830.35967-1-timothy.t.orling@linux.intel.com>
In-Reply-To: <20191216211830.35967-1-timothy.t.orling@linux.intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 18 Dec 2019 10:45:49 -0500
Message-ID: <CADkTA4Oik0jrfo55LKticFpQmnLvFd616dQ8bAq7D=sZTaZAgw@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] nss-pam-ldapd: inherit features_check
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Not sure how I managed to miss adding that check!

This is now merged and pushed.

Bruce

On Mon, Dec 16, 2019 at 5:02 PM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> Silence the warning about distro_features_check by inheriting
> the proper bblcass (features_check).
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> index dfa562f..98fb442 100644
> --- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> +++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> @@ -20,7 +20,7 @@ SRC_URI = "\
>         file://nslcd.service \
>         "
>
> -inherit autotools distro_features_check
> +inherit autotools features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  SRC_URI[md5sum] = "8c99fdc54f4bf9aca8c5f53fdb1403ff"
> --
> 2.24.0
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4879): https://lists.yoctoproject.org/g/meta-virtualization/message/4879
> Mute This Topic: https://lists.yoctoproject.org/mt/68744895/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
