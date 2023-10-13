Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380EECDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:38:21 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.41977.1697211497077782654
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 08:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bu/STeDn;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-57b706f604aso1248489eaf.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211496; x=1697816296; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVYN1gAOOyiaoV+xAE2PTfswDa14P7oEcfqKXNtCN/o=;
        b=Bu/STeDndD0zvRvQgyP90pZIfvLgOgf6RLwjizaYIK2GpiEp1RoQgxf45ixBUUfrbh
         cCQwBYY23He2eFqn8Cm1cLs8/owdFZkrNtKQ+n1WmcwbFVdDfnyuD/vGy97pfh/WJHpg
         2nXeHnoLaq8IA2WbSnCwS8I2mDfOvPwQ0emIryYkWG6ExurQH3IewYpLONgqX09o3jdq
         W6KpFIjKUIxR+LTWYQzIJUBkoLuJ6IqZ8ZMz5Qyf+BQaF2Keore42gIWzgDu9LFWRjL4
         UXb3fr9mObZZFpkrlshgGtm7Y+b8NaZe1/yP8EL90Q9GbLBeAjuBgU7JaZBW83DnrGcL
         qF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211496; x=1697816296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVYN1gAOOyiaoV+xAE2PTfswDa14P7oEcfqKXNtCN/o=;
        b=d9fcnKkAixGyaZu82U8/vzrYPxu81EojCqVR8uZ7nXiSlvUGy9sbTo4UIi70rTQKC6
         xFrvoWvcQgV/lCN0fSdusoot3j0uv41GdLT/FQl6T/bVxE07jawBdnpGqrQqTPnA+CDB
         7Jm+PMKiQHOGp2zWFk6S4dSKvUoG2YVICkeY9SURZYKOdDdyrUzTx74Xr1/58YnmobJI
         /L5kbubUfeckluH5IT49dELW6Ho+cjBnBYJaDa9i7aTbDlzlI4TLz1NptTfk6i5NiRKy
         7ubjbW9g5j2U4nvODh7kBjvxKcMPyd0XjtYeGTHDp0oZQ+mdpbyX2Sn3xjXNNs2eBuP/
         XX9Q==
X-Gm-Message-State: AOJu0YyLXvOO0MuRfC3fohCNB20jjwZrzU0AaSYjgBi8SEDl+aCma82C
	Freo+inwo0J/89Fg4+oUifSIGyx+aMU=
X-Google-Smtp-Source: AGHT+IH5BF1cffpe8nQfXnR9vyvNPkc4c7194DpfQC5ktfQNnRuagD8QI5AlVn4r6VE6TqkHgrv34Q==
X-Received: by 2002:a05:6870:a98b:b0:1d6:55a4:d97 with SMTP id ep11-20020a056870a98b00b001d655a40d97mr30004753oab.32.1697211495723;
        Fri, 13 Oct 2023 08:38:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::8282])
        by smtp.gmail.com with ESMTPSA id l11-20020a9d6a8b000000b006b8af3a2599sm684697otq.73.2023.10.13.08.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:38:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][PATCH v2] classes/image-oci-umoci: Handle mutliple entrypoint arguments
Date: Fri, 13 Oct 2023 09:38:07 -0600
Message-Id: <20231013153807.906542-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012162548.329780-1-JPEWhacker@gmail.com>
References: <20231012162548.329780-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 15:38:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8362

The entrypoint to a container is actually an array of the executable to
run and the arguments to pass to it. It is useful to be able to specify
the entire list as the entrypoint when creating containers so that
then entrypoint can be encoded with argument, e.g.

    ENTRYPOINT ["/usr/bin/python3", "my-script"]

The current way that image-oci-umoci.bbclass handles this is equivalent
to:

    ENTRYPOINT ["/usr/bin/python3"]
    CMD ["my-script"]

But this is undesirable as it means if the user passes arguments when
running the container, it will override the "my-script" argument and the
arguments will instead get passed to the python interpreter, which may
not be desired.

Instead, pass all the entry point arguments to umoci in a single
invocation using multiple --config.entrypoint arguments, which correctly
make the list as described above. The entire ENTRYPOINT list will start
with OCI_IMAGE_ENTRYPOINT, then have OCI_IMAGE_ENRTYPOINT_ARGS split by
spaces concatenated after it.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/image-oci-umoci.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index 58e4668..245dae5 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -99,10 +99,10 @@ IMAGE_CMD:oci() {
 	bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, but umoci does not"
 	bbnote "     expose variants. use sloci instead if this is important"
     fi
-    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entrypoint ${OCI_IMAGE_ENTRYPOINT}
-    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
-	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd "${OCI_IMAGE_ENTRYPOINT_ARGS}"
-    fi
+    umoci config --image $image_name:${OCI_IMAGE_TAG} \
+	--config.entrypoint "${OCI_IMAGE_ENTRYPOINT}" \
+	${@" ".join("--config.entrypoint %s" % s for s in d.getVar("OCI_IMAGE_ENTRYPOINT_ARGS").split())}
+
     umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_IMAGE_AUTHOR_EMAIL}
 
     # make a tar version of the image direcotry
-- 
2.34.1


