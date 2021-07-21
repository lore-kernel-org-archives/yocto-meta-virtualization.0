Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.385.1626907152389093615
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 15:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gUSkUQ/O;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id hr1so5609055ejc.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jul 2021 15:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6sTfyYGFuDQ+CasUa8hoMKk6t9C0/tXqWf+liFKCjzI=;
        b=gUSkUQ/O0EL5TJVys/iVvlgpW65Im+jmjNSsoz/Ah2UGMJWJncBKBPq5Pf/np+H8OC
         TcLX+D7aEf5fQi7/YoEVY1vlmvqe78ZaeOI1G4TpXtwF3YLJVfqy+JGv8hmq3jEjXYUQ
         QL13LkK/qLCfrEwSqNdJDil2uf9JWmHjHwakpxEZdUTZPJOUusAiSTSGCJ16TrJMenrl
         gFnZm8t5pE8/B+XM3ZqPeKi/lTbIA6LhOfYl5lfKfThE2bsIqfrTbW2V80CiWfP/PsXF
         aoYtL9zCgVLsrrxmnpHgT73UexMcTP9Re3DdrJO3F9i98bctISTcOe5amdtE8y5mpqRs
         +BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6sTfyYGFuDQ+CasUa8hoMKk6t9C0/tXqWf+liFKCjzI=;
        b=EAcARPeOlMmu9aWCE9QW1HzNzWHpVO4q/OQE0RFY9c1lBEkXprKXEXPBgHypQk64Nt
         14QmqYV5k8CpPR+pWDeSK8Luov/PitAWVeIvWqvzKbOUa4vxBplbjeni+rojQeAZAyCx
         wwmcMgSvQNsSMReQ94+24cOda/cH9gGYnnzQhjvx3osw397nPJ5nll2XG8GZNXicpZke
         mvI0jAAWzE+aljKOrw9mUwwokXPm/dcGuhHn5RD3Un9SFE1OPrjRzDsKiN8E2DAQd6iD
         oPYSrj2nYvUeHOxHC/AcKDTFf70/9okxE+qS+OUz0Ghs5quk6oWpwYyIIfFhNmPbjKdG
         Suzg==
X-Gm-Message-State: AOAM5329HRZWp8ysW+wAAQ8knAKsaozZr0PfaR0YeCBceOStg5nyGEYV
	JmhtTaBBDxM2uVbmubamrmWG/Rw2k3UaaiqdFQlVnxE0m+zjzcm+
X-Google-Smtp-Source: ABdhPJyrj6d4as0FeS6njTg86ZGwWbOS7rX1w/gGSdvTHjghzWb3mWGgTPLcW45OxwEDCE/hdqMf9vIGAgc+vAf2Jlg=
X-Received: by 2002:a17:906:4b46:: with SMTP id j6mr40798031ejv.247.1626907150957;
 Wed, 21 Jul 2021 15:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4PUxyb=FjZ9TLVMRMn5T_mMpuomAH-Pe0Psj9QEeqssLA@mail.gmail.com>
 <7328.1626882389960955019@lists.yoctoproject.org>
In-Reply-To: <7328.1626882389960955019@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 21 Jul 2021 18:38:59 -0400
Message-ID: <CADkTA4PRdAjrqfbPdhh5oKjBt5zpLXvbfkA1vqYh+WYiaJuuJw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] initrd: bump busybox to 1.33.1 to match oe-core
To: Daniel Dragomir <Daniel.Dragomir@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Diego had sent a patch for this earlier today, so I grabbed his and we
should be good to go.

Bruce

On Wed, Jul 21, 2021 at 11:46 AM Daniel Dragomir
<Daniel.Dragomir@windriver.com> wrote:
>
> Hi Bruce!
> Busybox was upgraded to 1.33.1 for hardknott branch too in oe-core.
> Can you please backport this patch for hardknott in meta-virtualization?
>
> Thanks,
> Daniel
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
