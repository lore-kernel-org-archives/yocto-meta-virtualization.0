Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1573.1793899449157110826
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 09:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=v+HPQsim;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc603a168fso684040137.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 09:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793899448; x=1794504248; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XYMPnR4abDkjGan1p4QzED7oQTB0T5hJxp56sN4uPIE=;
        b=v+HPQsim3knlK/TT2R1ht/wSA/5OB7j16mKNd00T6p/wSdILnuHuhwa7SKru6zN67j
         1VmNzAr+RoVS8wTSL+aLgh7QjbnHBIF6FcA/2LAE+IPr3wLNzvHylFC82WH2k1EJr2e+
         DOhl6d0JuzMfebkTNeugHsLcunjFJvsU3djSnBEwqNAPwq45K5RKWFRK/zbM+KhprL1g
         y/8ognmk3oGhh8xZ9OG6uTktRVqccTv6F8YwwMXLDxMRwVqyXUziAt1ukCzoPNwmAkHw
         7zsBpzvYBabWnk4RheO29JNiwSBp5YQqOFZ2Wt0xeBrUJnNk6ENtGTTWlAErh8TqAoC/
         d5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899448; x=1794504248;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYMPnR4abDkjGan1p4QzED7oQTB0T5hJxp56sN4uPIE=;
        b=h0kDfmdAe2+fhbUm+1OhTB1syy2GQ/Bp87i8amkhdgcpUY3akGBxieA0PWJWoFYwOu
         2IFzBQQn1nkrcmvbzjJChz3VsD3l6QiDXH9HopQ55bLkjXcmSOFGjpiJxTHzbl5ljUZQ
         XZpaEWe9cTMNxReDpD5nti4AYXGG9yeaU1DamGkv2LhBXAQSBs2+BTpAwTqOmHnHvfnp
         kIDlwZXv3EsHJaldB8pwG2whADW/uUlxAAAMWV9UTStYhW0oK+Gi+u8petwxCP64ZlA+
         bfaeWPGho+NTNHyAF3Tr9Pvydm5c/Esrv4//aSK3ibaMPH+MrnRY8ZdiFdyO5WNtuoFW
         QHKw==
X-Gm-Message-State: APuU4Z8W+/nsu8To6n0iGdSOwQw6zq+1i9p6TBSrTHiKLiX1NkSWK21W
	5W83m6wwKXnQvmrebeGsc8UTPqGKWxA0DOP4F0R/9nnDKm3RVP2P/gpX
X-Gm-Gg: AYBFou0s5BhL5U3YPng9plKNt54L9rfPLr5gT+BTmiDUBnhIcRnNHAew81MiAIsL+9i
	Cb15AAbKLYQFp+zCrYC2U68dJgON6uQavrYwcikux/pPaQPmnOwTzKE0E48G4Gk7XDkxTyjKYMY
	Y8yMZAaAruiEMqbxSVxBDsWlQZxsu3sjxK9yGFkcjtA8rH9skKMh0JLROxcW6Esarl7O8opka3S
	5ezFPvFxctFXQMlUX7Wcp7SuD3EKBZl18fW5AIwnrYHVprWFEJ7ujpTWPCHdLU8wYjwiWkb0sgx
	li6WF+GqtOJHKkJBLvrF43LialGvnylFgpfFNpCNlWB4lBbPj3YSNjTkQDkERlS1GDNoMWz9mu9
	IkHzYOiZoL/JjTVmrqV7m+J3xgJ+7UezeoiLAeJG0VvWD4IJOv5JYrRfatlBzhF+S+gj5+izAk6
	WB15QtYuPgl8BQfTpY9dAUVXL5uHiC1SwxACwy5h57fOMHwYBGLa3HSw+dc2X04bsxCXpK0cyuN
	V0Ei52NlXda9U4Zln0dwgLnZT4h2Mqm6Z802SQIpsxzXWacnMeCsC5WMdMC38zfBNPUcxvO9PVz
	nl4ZRaShN1epIvwXuIeYcIu5ZtnP/u8B+hW6b5Z+BBL32jM4xa+1QhSEjnOOcjNflI/qemWMlWl
	HOskrc0xUT/snRsDCVXFmjyS6eCgJ21rmwSzihuy5oxFVt8luEnuQ
X-Received: by 2002:a05:6102:5109:b0:7c3:472d:be6b with SMTP id ada2fe7eead31-7d2a1696267mr170307137.33.1793899447646;
        Thu, 05 Nov 2026 09:24:07 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d69af4fcsm4692214241.2.2026.11.05.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:24:07 -0800 (PST)
Message-ID: <6aecbbb7.f30e80cb.223479.b5ff@mx.google.com>
Date: Thu, 05 Nov 2026 09:24:07 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] image-oci: add OCI runtime bundle output
In-Reply-To: <1074218742.1918618.1793711762503.JavaMail.zimbra@savoirfairelinux.com>
References: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com>
 <6abd3113.e51cd04b.1fe4c8.0684@mx.google.com>
 <1760387508.1766093.1791807841997.JavaMail.zimbra@savoirfairelinux.com>
 <6ada5b42.4bcc4235.70a25.8048@mx.google.com>
 <1074218742.1918618.1793711762503.JavaMail.zimbra@savoirfairelinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 17:24:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10160

Thanks Tanguy, that list is what I needed.

On the size question, I need to correct my earlier mail. The .tar has
never carried the bundle alongside the OCI layout, and I shouldn't have
described it that way. The bundle will be a separate output, selected
as a mode. For the simple oci-bundle case you pick one or the other, so
nobody carries both, and existing users of the .tar and -dir.tar aren't
affected.

I won't be adding special replace or append semantics. The defaults
will be in the variables, so that's just normal bitbake syntax:
assigning replaces them, and +=, :append and :remove work as usual.

You're right about the intermediate bundle's config.json. I also
shouldn't have suggested keeping that directory as the output. The
bundle in deploy will be unpacked from the final image, after the
config is applied, so it has the final settings. The working copy
stays internal to the build. process.args will be the entrypoint
followed by cmd, per the runtime spec, and handled the same way in both
the umoci and sloci backends.

I'll test against your list and push the WIP branch when it's in
shape. Your offer to test and review would be great at that point.

Bruce
