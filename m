Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A146C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:11:49 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8481.1784581903264796808
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kp0pE0o7;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so2047280e0c.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784581902; x=1785186702; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r6UyAkyYx8HCZf0a8s4h4vFkgRs2WauAdIY1XqvwD9A=;
        b=kp0pE0o7dTpba57sEFPhdyk0IJHIK7GkUU6g4g4a1vEufylReQvvzrr/Vo7skS8TI9
         zdXDdjTejTpNSnSlVzY75hsIArT60GF5C09h2C/Thws16LKpkawzLQscE2aXSIqOB59w
         D5lDEwyrDwGcwneT4C1QJY29xgFfC8oQulwE5BW3i3SRHbEUuJgfmXU4OjMnvRqHoqmJ
         amgl4AGIt5PsvjsYX46MWlx7WgAL27kqNKHPVT7tR5nYq18b9Y5/7R793I5JrW3/vdyt
         IHpjoVMD7T68OPfkbitNwnkPIZjSx0+yr1hdrBCUHTKtmtN0G5xjRcKbieO5Stb0xAIV
         7pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784581902; x=1785186702;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6UyAkyYx8HCZf0a8s4h4vFkgRs2WauAdIY1XqvwD9A=;
        b=Epgn+FlHL3kZ9V+0U0NGf0X1p2eabn7ZMnvuJwzPGcN+V2/xWs7gLTXCSkHf3w9Vke
         3c/z+6Nry//KXHr7YigmAXVIwxA5eEinve2PpNC0nmXq4lzjgaSgb28q+JkVX891wxNI
         XYe2Voop46WENoRisFi8drxixrbeaB1ljDJh36fj0gD8Nmw9y/R+x2sCR/8+ZqginOms
         hPhHbHpreYLSySrqL05bW36mRs116p1wAF8Hevn74hVLkz9sIIzXfko6oUcBVJhW1CDF
         XjjFOydcvQND+bS9XGvOfAMEKKUhwcS2RJBjWNzsUfR+X4OtPz6QVUE0nmupdJrZ1jDO
         6OBg==
X-Forwarded-Encrypted: i=1; AHgh+RoDK4NYWOidsaQpQ+92P+jV5qMU0+bBj6Q4VXcU9vjK3zwLy7qlx8GT4d4ht3a5gRQKkUYSb5yfSxXueVUP14c0twqe@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzB/udga90I4unH1rDn0/J/XTFNIylSm5CRCsSsZFPcIn9eskZG
	QfrGKIrs+lLCsq7XKgLv9M5k3IjqZsKB3tW43GO6nLkcv63VrRf6Q6mu
X-Gm-Gg: AfdE7clbdGKGJAGL+4+Z5P6b1UgU6hr9Ftyn7W4xDsiNvLTMDFYrnB3g9GsLPh5iOOh
	XeXgWsmyqKKZ/ygnbZsWgzHQTWiprO3VDSzcT0ThUblUW46UntigQ8Zw7Uxc9SyX2Kk2lU0OdQG
	psuh2CQLCSBaryFp68PVUXUC8vicl6J5tp+1Swe/qQF3I0Or0J2Wb+sGqg12le46xCm6U+MhHHL
	Nh7lmWbwAbsrqrUKgEYGrOb0rv/+A30DZ2kWZnE8y/qg3pbCeVCj6SMPzvzp80xnEXQhpTHs3+h
	F14vYov/EVRx8Knr21iAC3L0XKJ2Bcqspv72sGGzG9zTXaG5OYazJ4w09es4hKoIG6vguVLm9lt
	AbV9BdrGTb6GA0XFzjmZsnIa81K6I79bGxkPnBYizEV6sThTEefMrt6hxmrgMlX1Lqctvi/9cwF
	8JEQr9eF+YAq4o15sDLuZKdSSmBWQ1+R4MVJJNM9ND6W45+rNgMh73GQTtslD3ujYBpljUZnr2q
	BBHsQ3kGX6K/kI7tvKY9CmCrrzk92WMihOGdf24xQuCrjijUh1uj+GK/Jg97WWViu5KspWs6ZNq
	Rq4=
X-Received: by 2002:a05:6122:e248:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5c1977d7f42mr4152914e0c.4.1784581902048;
        Mon, 20 Jul 2026 14:11:42 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1eee1edfdsm11740868e0c.6.2026.07.20.14.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:11:41 -0700 (PDT)
Message-ID: <6a5e8f0d.4cee2a04.252f89.ec06@mx.google.com>
Date: Mon, 20 Jul 2026 14:11:41 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kraghava@qti.qualcomm.com, meta-virtualization@lists.yoctoproject.org
Cc: vkraleti@qti.qualcomm.com, anujmitt@qti.qualcomm.com,
 sbanerje@qti.qualcomm.com
Subject: Re: [PATCH v3 0/2] Add crosvm recipe to meta-virtualization
In-Reply-To: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
References: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:11:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9960

Hi Keerthivasan,

Thanks for the v3, the series has been applied to master and is
staged on master-next.

Nearly every item from the last round is picked up: postfunc-remove is
in place, the LIC_FILES_CHKSUM now points at the in-source LICENSE,
the bindgen wiring (clang-native + LIBCLANG_PATH +
BINDGEN_EXTRA_CLANG_ARGS) is there, BBCLASSEXTEND = "native" is
dropped, the "uage" typo is fixed in the image recipe, and the
KVM_MODULES:aarch64 empty override is kept with a tightened
comment.

The inline TODO about breaking wayland DEPENDS into pkgconfig-mapped
feature flags is a good spot for that follow-up.

One process point for the next round (and for any future series):
please include a "Changes in vN" section in the cover letter. This v3
cover is byte-identical to the v2 cover, so the only way to see what
changed was to diff the actual patches. That works for a 2-patch
series, but it defeats archiving: when we (or anyone else) need to
track a still-open TODO across versions later, the cover-letter
changelog is the canonical place to find it.

Two things I flagged in earlier reviews that this v3 doesn't touch:

  1. The single BSD-3-Clause LICENSE declaration for a 966-crate tree
     almost certainly under-represents the actual license mix. Not
     blocking — other recipes in the layer have the same issue and it's
     on my broader cleanup list — but a per-recipe TODO comment would
     help track it.

  2. The wayland unconditional DEPENDS. You've noted the intent
     inline; a real PACKAGECONFIG follow-up is still open.

Neither is blocking the merge; the series is in as-is on master
and master-next.

Recording them here so the trail is on the list.

Bruce

