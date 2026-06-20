Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B20CDB46D
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 03:42:45 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.513.1781926957205798667
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 20:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gM6SlgX8;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9157d3f2098so306715385a.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Jun 2026 20:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781926956; x=1782531756; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+UWiVOC2MBDDOf0GhN4DLeDNRRHhpqEI4imKs7s/2k=;
        b=gM6SlgX8QpTWshgPGrhdrUJQVI6TAa+zd7lLwRUGZ5MP8po4HIC2AYNA5yFi3e+XvJ
         4Gy3Ls490kYS/pcEf7pWrawEvs84sYAPZ7gD9PwqCa9LsoW8mQp7PHl268sspvKZFnJI
         fy/ywpM1X1CRpt4TePavsr1osje+s2bXI1DkFmHVuLKD2AruKQZPD0pOvnOE8CW6Z52m
         ze2T72NWsuZQrug4yXTHXY+r5P9geaCFa36wdMD+AQkKjHrfXejOgJgVqWvCdDJWqqjS
         wvbfcSF0ZyubeSfjee0ir47LqwhQF4ACU4NuN5mT/ppND/lKXLUYKEmeRXpDXUultdqS
         r/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781926956; x=1782531756;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+UWiVOC2MBDDOf0GhN4DLeDNRRHhpqEI4imKs7s/2k=;
        b=YMd8okaw5q+lnaTtoeVB+cmkvdLwVnD2c/egMiJwJ/gDUAcZQzfXddX2wKbHcCs7Gd
         QMfsNt9PV6bPDfGeRrO+a6Q7wLSlQfUkVhx+imt11NN3AZoXiiFlafnCegIK7GCRPKY6
         SY6oyc/ZlWOt/gCWF8J3PC8pIk+0dDqUkBugbIK9o3gmoCZxHZtD2ASA/pLE0ScvYsvz
         F1Qj7Y6Vyej09bX37U6A1D2jEHih4a2YUlQmbdIloC0P0r27A4bwgmOr2dvUlco7KDAk
         2WgjHx71pnLng9gFQcE4l9elCgFv/ObD8q8I0YBeBTeJHoIkEt3xhPGz3lUl1yvLGk+r
         hAuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lpcSki1y8Em1dZncpaeDJPJJEIIsqz/Rhss7eSV0DJL+bv46xDpcTUW23kG5SJTtDfjCf67An3EJzHHUJCk131waZ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxVelJBa3oP35AV2e5XGRrmFi0Krq0PFGKMVO6HKAUVLJPFjNsQ
	iZYUv2yTP3WDuwN2XH1JtMj2fmDYxpe2moJWGIjW2WP5Q+ZZYo8k+zVl
X-Gm-Gg: AfdE7cl0aiGEufWPAxAoH1OpLUIbSS+FyyBnEF48ugMlvOJ/Li1DB2pwFJm6ApeHhND
	iIDu6FexuSG1zFgincjYKMDyUsedG9ywB1NjHtSPDz7YQr37YsUnFryYodyoVBvCdyh1Q7wQbWL
	togm9fYJZ1Fo57mmGogYaZJl1760zpHFSepFhLKOLnmkkAvafFjtOOEGyrPSA61aBwkpzu7U+L/
	iWamWKZr3LEoFexNf4qoykv+cA886CKwLwhqpyCT56H1Jp6gmDdDTmGP5G7VZyUahF+ymcJwZUQ
	v03P3+U+xpqxZfloJkk/RCodg56AE0QdDUFJ8gcULAoJuGbmkMCWlxRHtHav4HJaU4ndozjOJDb
	9JPh1y5vShn3rYA1bK1OAiJYgG+RmkQTWnlHTP6eEYC4OzUCH3i5M5O5b1XykiPFh4xOJWMz7D6
	jzku3nSaN8CyfRzEc9Yx/U05H8kWtAgfdKceAMwEaIlRpasBItD8RHHWljbOlPo0qwfUpKUUB32
	mpFLBVraJgYabtLPM9HYAAfQX2PqWePtYiByr84TsnpodSzzyvQzhrkZ0GoVe0vkGwFzKblVet7
	kVTOh/DtyhRShA==
X-Received: by 2002:a05:620a:1a1c:b0:915:cda5:2803 with SMTP id af79cd13be357-920d480ec73mr751452485a.56.1781926955965;
        Fri, 19 Jun 2026 20:42:35 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-921d796a11asm176903685a.7.2026.06.19.20.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 20:42:35 -0700 (PDT)
Message-ID: <6a360c2b.eef12218.262e9b.f8ea@mx.google.com>
Date: Fri, 19 Jun 2026 20:42:35 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kraghava@qti.qualcomm.com, meta-virtualization@lists.yoctoproject.org
Cc: vkraleti@qti.qualcomm.com, anujmitt@qti.qualcomm.com,
 sbanerje@qti.qualcomm.com
Subject: Re: [PATCH v2 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
In-Reply-To: <20260613060743.3120135-2-kraghava@qti.qualcomm.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-2-kraghava@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 20 Jun 2026 03:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9895

The big one is do_filter_minijail_cargo_config. The problem is real but
the workaround feels heavier than it needs to be =E2=80=94 and I think we can
delete the task entirely with a one-character change to SRC_URI.

What's happening today: cargo_common_do_patch_paths() walks SRC_URI for
git entries with name=3D set, and for each one appends a [patch.crates-io]
entry to ${CARGO_HOME}/config.toml keyed on the name=3D value. So name=3D
minijail produces

    [patch.crates-io]
    minijail =3D { path =3D "${UNPACKDIR}/git/third_party/minijail" }

But crosvm's own upstream Cargo.toml already has

    [patch.crates-io]
    minijail =3D { path =3D "./third_party/minijail" }

Two entries, same key. Cargo doesn't allow duplicate [patch.crates-io]
keys regardless of whether the paths resolve to the same directory =E2=80=94
so the build breaks and the sed task exists to delete the auto-injected
line.

If we rename the SRC_URI name=3D to anything that isn't "minijail", the
collision disappears:

    SRC_URI =3D " \
        git://github.com/google/crosvm.git;branch=3Dmain;protocol=3Dhttps;nam=
e=3Dcrosvm \
        git://github.com/google/minijail.git;branch=3Dmain;protocol=3Dhttps;n=
ame=3Dminijail_src;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/third_party/mini=
jail \
    "

    SRCREV_crosvm       =3D "..."
    SRCREV_minijail_src =3D "..."
    SRCREV_FORMAT       =3D "crosvm_minijail_src"

The unpacked source still lands at the same place on disk (destsuffix
is what controls that), so crosvm's own Cargo.toml relative-path
patch still finds it and the build consumes the source as before.
The only change is that cargo_common now writes

    minijail_src =3D { path =3D "..." }

into config.toml =E2=80=94 an entry keyed on a crate name nothing in the
dep graph references. Cargo will emit a non-fatal warning along the
lines of

    warning: Patch `minijail_src v...` was not used in the crate graph

That warning is expected and fine =E2=80=94 please don't try to suppress it.
It's the price of having two patch tables (upstream's and OE-core's)
both pointing at the same on-disk source from different angles, and
making them silently co-exist is better than fighting either one.

With that, the entire do_filter_minijail_cargo_config task and its
addtask line can go away. A one-line comment above the SRC_URI noting
"name=3D is deliberately not 'minijail' so cargo_common's auto-injected
[patch.crates-io] entry doesn't collide with crosvm's own Cargo.toml,
which already patches minijail at ./third_party/minijail" would help
the next person who looks at this.

Smaller items:

  - LIC_FILES_CHKSUM points at ${COMMON_LICENSE_DIR}/BSD-3-Clause-Clear
    rather than the LICENSE file in the cloned source. The Yocto-shipped
    template is a generic copy; an edit to upstream's LICENSE (year
    bump, contributor line) won't trip do_populate_lic the way it
    should. Better as file://LICENSE;md5=3D<sum-from-actual-source>.

  - Three things I asked about on v4 that I don't see addressed:

    * BBCLASSEXTEND =3D "native" =E2=80=94 I'd prefer we not have it in this
      first version. Do a runqemu alternative as a separate series
      and do it then.

    * DEPENDS includes wayland/wayland-native/wayland-protocols
      unconditionally. Is crosvm always built with the GPU/display
      feature on here? If those feature-bits can be disabled, please
      consider a PACKAGECONFIG so wayland is only pulled in when the
      display path is actually wanted. Acceptable to defer for now,
      but please call it out as a follow-up.

    * 966 pinned crates and a single BSD-3-Clause-Clear LICENSE
      declaration =E2=80=94 there is almost certainly licence variation in
      that set. This isn't unique to crosvm (other recipes in the
      layer are guilty too and I'm working through them), so it
      isn't blocking, but please file/track it as a follow-up.

Bruce

