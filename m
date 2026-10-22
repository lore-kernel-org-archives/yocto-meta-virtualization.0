Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6800.1792696162386929618
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j+JSvCJ1;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5365f9a04c5so815531cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696161; x=1793300961; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=j+JSvCJ1XVEDcXMhwjB8yrKLYDPl+NpL6oVq4RcTEAPwhzl21siZiSRqjPW94DsqDJ
         bFfV0RPqNJFegRIbJT0vgex/fgsTiI6qLII6UanF2SZpjtXpti+h5SSa3uAR2Ul563Aj
         Oitzsy9SnM2R4IotZ3IaW5Jfvbv8SZRwe9m2ueHXP6X0kVmeRRIXDJoKXPzPjR/IMFLh
         8mHLPE+aA6Ccc0DNAv/c0Ao0S9s2VpuYIMNSMW0oMtJ8dvP4JuE2ruu5vZ1SCupstm+I
         lsdSbPcWkYzKTFYLy6ciwFKAHQ989jN5NLR0XqMxgxXnQVLZtITgEfLdLgEOxDk/m2v4
         JeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696161; x=1793300961;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=1EiqjbCQXOFFOib3/wbdN6EJmRXYw53w78WYIC8sdVKZZtg1OjXVk91kBgbqaWVP6B
         wXoQWzXxayQiDmoylQA5QxKZ1UxVtepFubZ0g0C3IQL9ucqMVoJwx3tLoN1OKxoqV/om
         T4j8Wwx0owvMyiqrlONqv7yRiLuuPTOWS+3UCBZCJN+zy3xF7E31F1bf69XPvF5fKibD
         /XApcgWxAdMAVxLiGp6UW7wu0RHOSq32SGeprxua8klVQnLfshKMayfsxghOlI3hgSdK
         ekSy3rNW80x8UAVASjs+/3AUDfKtRJtXn6RwQGxpRlML5yZb5cp/XLYh6KzRAr8vBwdH
         /RCQ==
X-Gm-Message-State: AFq9FYIvWA8E82lg3tPV0bb95NUqPTzUxF7Y7l/i4JOPRuvYSVw585cO
	FqOanwf8q67jbvrn/kF9F/1ZIr3uh1vTzG+7ApsjBvdBMnye5EolNmFWhJHiFNZm
X-Gm-Gg: AYBFou1eWAqkcv3TEDkClJSrhw5VmPhaYBqJjxmiiQNcRg/oi2NeZ8nVEFFhiMQ+bQ3
	9CwBU4QXKMl0t4WOnlchfy9m+LNCZd30EK7EEMPAYlXMfz5/EI/85A9C3pQ85+UWjM2JJCJJO9O
	AEOdMUqp7rsyygty4cG18f64GFpXYPgnTl/pAzhMCZAwcPwqMoaj2DfxwwIDCXYagLuhMnzbgBm
	povD4CIXp0+KF9mRjI0KQpT8adWSqzPinnF2FXxPc81vq56yyzgy2H15RbDfIr+r+rYW4/wiEfR
	MwPFugch12G9OadjDv8Ii5+W6xxXO9j68S2olrNqZUBkFkPW/U/F7Z/a1gwAFNBGsD4afdrlq4A
	QSLLXoE1V0Q1uk45cT2Vo5iUNeq137pHvJrOX9sfztWEd0UIm5d0d7x1QNTs15oERX7uoKXRxlq
	KPBcdLFoePiRVp+o41hLp44/D+G4KEYJUczi0vzea0A3PZgpQEQc9upbScJu/Y38Fx+hqVWAfK3
	QU4umimU3X4TJkqBmvmCXD4d/IUOcQI03iJjMn8tM+UfkMdlXiEL1+07EFMI18syB4B2eaWfThY
	0b90V/VftuGn92rNoYC3uAOV2Yzfzk3EHvlm3ZA3bPmSjL5nWmpqDXamLz3wMzaB3z9qQsuEP5b
	ek65kVX5AXAaAasYzCDRZgPZcrorDY4lfMs42QKm53oD2sAlCGvMkyA==
X-Received: by 2002:ac8:5d11:0:b0:536:5f01:7016 with SMTP id d75a77b69052e-5369b7ca411mr100453021cf.38.1792696161203;
        Thu, 22 Oct 2026 12:09:21 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c17f3f53sm32061cf.13.2026.10.22.12.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:09:20 -0700 (PDT)
Message-ID: <6ada5f60.17e05534.3f1b2.0ac1@mx.google.com>
Date: Thu, 22 Oct 2026 12:09:20 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Roopa.Kalmath@windriver.com
Subject: Re: [meta-virtualization][wrynose][PATCH] libvirt: fix CVE-2026-18917
In-Reply-To: <20261022094457.3334481-1-Roopa.Kalmath@windriver.com>
References: <20261022094457.3334481-1-Roopa.Kalmath@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10131

merged

Bruce
