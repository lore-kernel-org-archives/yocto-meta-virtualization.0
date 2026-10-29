Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3622.1793311611712603781
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Oct 2026 15:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HY5lh7cg;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93ece7a73b9so1551285a.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Oct 2026 15:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311611; x=1793916411; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zx+dB/FcLMhiFus2TkRs1+LfVjuGpK419TDSuRskxcE=;
        b=HY5lh7cgvFZFRBQ/pTZRvPOB3dMhzJIk08lTtiar00gMcab8CJV2VONjcmqcadCeTd
         Ks4M0i+LF4UX0/kMe5Fm2Yx0LpDYAMFHPFhv9Mn82MKks6EwB7qzaX3qzKrpQLieuN7j
         QVUNqYYD4FOFsEqkKYrdk8DfqWmAPia1a/l41+4hPaqIh1U6wwyOYFdDOn3HDioq0fQv
         sUjLoK1uigB/UHsXGpQHfFCTUeEeePGGzQZKksXm0LB+7JwxstZUvMPP6ZdaprVI3sxY
         Z4gae61MNS0j0P+3YEeNUZ4MD6rDu/IHXFFqQRmBUvAyT3V1oljVeugPZlGrRwUyGgWb
         AzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311611; x=1793916411;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zx+dB/FcLMhiFus2TkRs1+LfVjuGpK419TDSuRskxcE=;
        b=uH3V1TKn98DSqNVUxdwReRa5cLVlkgmBS80Q8tJEuR6pAAE7hmkmx//frZ9KDfyjwN
         EGkKrZ9wzpimWwHSavdmBpRkuRgHFHmLy23ObaLNEd5cs5NiPnV6BifgOQGXNp6ezDnr
         8p/MT5/lQHrytLg1JfJ82MZ6NrcobePbpVbWViJfbr8CDQdn5UttJxbIb+9OGujyE6Rb
         FS17FI5yVeIE9LnJJDhHJvq2qdXyLb7bRhkziNRVOdVXuokR5XNvKQ08jS/+POwNpBvo
         4Bv0VQxbQk12i95mB/9b6/BjG5DeTrc9Sa57Mj5hWQ90BxOuDjX/qoQSenlCSa863WRT
         MRNw==
X-Gm-Message-State: AFq9FYKqnYJtAfzBTlIXFbIvr9TvdR7a3Zz1nXATAKbmaiiMp4/UNYmt
	WV8kGZqfUaMIUD7l23AF+WLmxtbEwyWH8neb3pXo2eC74Mio0NMbm8Ds
X-Gm-Gg: AYBFou2qJxvp0PatWZSQiPnjRic3dGxqwXK2qra51R0TvFhhZOGRCvG278+7cczx/6I
	uzwhYxKf0HEkVL1mHQKaKs8ELE1YlHLLXWkKZp/Qn5j9ZMNEZWKss/I5OdNipew9hQxJI/SJ/JJ
	Ve9DhmjLwCxTV4l4psQ1S2kjoTQ7WocL9fCQkMYJnrs7D3GtpDtbL+CaWnFW1/+78nOeMSnKTA/
	ABubkY3VvIanCshuoM5n7DmBPIq4r61k4TeKkPHZCzzxE1cu0gUHbTfeyhUZ5DajZcVJu+GA2wD
	kwBpQziYgtfNnIVeIhBglOhgAXkZjYktCz5n9pbni0ryTNmxdQo/X6+w97ft/9dphB9m8dWpxbZ
	5DFwRhinn4tpuZvBT439tDak63aXnkRmSj1ZifxSQ4EDx3AAwl62qW0wN9z1HQ6texTzP3/Wwdx
	JyRjOjj9IreJXfnKay7KYOqkJGF1gkdkUr+iveI1ulOhwlrAOA+1W/zHbxG5rzbHL3f8SIhtIpS
	GzpribrpVBSYWuE3cjyrhilpF+BMJdNlvptqqKdA5RE5DqE1K1LJwlwdLqAlNPn0uGoWyEBlld2
	XVy+wjMFrlUcozsbvMXJiNJmJtCt5wZ6UcIurjMu2LoGNWFa+ApU44DioazHIFyOyK3koohFdpu
	sdKjnJ4vZNljg2lY5fSnAhuWPNvkGcfssjYyVH4urJ0KxQu+ozE9R
X-Received: by 2002:a05:620a:254a:b0:93e:6325:ae6d with SMTP id af79cd13be357-9442175ae31mr98863285a.40.1793311610456;
        Thu, 29 Oct 2026 15:06:50 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94421206a38sm49871085a.18.2026.10.29.15.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:06:49 -0700 (PDT)
Message-ID: <6ae3c379.3b39db7d.309af2.9db0@mx.google.com>
Date: Thu, 29 Oct 2026 15:06:49 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [meta-virtualization][PATCH v2] fuse-overlayfs-snapshotter: add recipe
In-Reply-To: <20261027102827.1894267-1-thomas.perrot@bootlin.com>
References: <20261027102827.1894267-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Oct 2026 22:06:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10143

merged, with a small follow-up on top stripping the vestigial ;shallow=1
parms from the generated SRC_URI (silently ignored by bitbake; nothing
you need to do).

Bruce
