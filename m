Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8922AE00C01; Fri, 29 Sep 2017 12:03:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B8A7E00B1B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 29 Sep 2017 12:03:39 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id z14so339178qkg.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 29 Sep 2017 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=R4XaiXz7qBnazwSNATzOwaESozomho2+dbJFTvIx+V0=;
	b=PrphisvJ3WIb2r+g9JN9m0llMah+B00zvBxJLDZonoCHnuLThhv6/tPCBRyrd2UTyX
	JZL24r4zYNM77GQEWk7/iCCPCeHsF8tqakljPI1QNXwSfjs7479MY8fJnc3X/66DGBth
	2ggm9CcZZ766adZDK60G4SX8u5yqNdgfq4heXUSrjdunTKBLm/I2HUtvYqDdmiophthw
	4YrCzcTziQCW2EiWpJkvduZujROxUqVIr62aIijVxH5CiGIwSaYalTousT66itvaSWik
	qK9/aaVW5ShWc2KMLE+tNWrEFWHOjgzc1XR+47Ya/hng9jgJ+4mxRmWrqGV/ejJfOo7J
	ksdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=R4XaiXz7qBnazwSNATzOwaESozomho2+dbJFTvIx+V0=;
	b=EyUndRz/mZQHwVEF0e0led3uBd6L4pRclt7DrXWdF6WobEiB5xJK8NCMLHMS68GO2q
	c3SL4tOGUXJf7AuhlFbyY0C7AVZkn31FCdajwt/63bItejHC/Wj5C0ktQQbvhCfvy1G1
	5aQVW7guoHuFcd70hVnl18w2M2fZ9wxSB6+BJVVtOVlYjGY6cwlzazP3wzOrBuSU6cq5
	S2PZzoaK66MCBY2iFUcWyUZTg9TkPfw9KtsI+rZIuroHldY3/EhqRTNnvPJMWPpLiSm7
	HGeSmQJqzU8GCskB12BGuMKovZsR4EDv/HR5eOC1mKW9v5dqRlPOHgmRVd+mYZKhHv7I
	arJg==
X-Gm-Message-State: AMCzsaWKfTfBbGmxfJMrEBZ4gIL9YQz0nZZmcAXSdAMegDgRmWet91Yp
	7Fm4j/HC4XpvdvXbWdWy1daxTVWwe0FTpTKjvD4=
X-Google-Smtp-Source: AOwi7QAopvM+/cgVA9WQPgLi3Vgp4Zp+JsKv/oWur8Lno51qGHsjELUGOOWu0vGgQQ7HJU9Iar7sPYk8Q2Q3v6D1uC0=
X-Received: by 10.55.52.19 with SMTP id b19mr4461948qka.218.1506711818256;
	Fri, 29 Sep 2017 12:03:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Fri, 29 Sep 2017 12:03:37 -0700 (PDT)
In-Reply-To: <CADkTA4PqTHeL4BUpyNrEgZAqPNzyL3CcBgmruRf7gRP1Oc2kpg@mail.gmail.com>
References: <1506045785-4157-1-git-send-email-yi.zhao@windriver.com>
	<e4fb3507-4cff-e46e-6009-2ff6a2a3d7d7@windriver.com>
	<CADkTA4PqTHeL4BUpyNrEgZAqPNzyL3CcBgmruRf7gRP1Oc2kpg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 29 Sep 2017 15:03:37 -0400
Message-ID: <CADkTA4NUAzT3X5ECiYJXjxE4U+rFB5kUb9cJtbCvZ4+tGckEYw@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] spice: fix CVE-2017-7506
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2017 19:03:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this is now merged.

Bruce

On Thu, Sep 28, 2017 at 8:35 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> Sorry for not replying, I had this staged last week, but due to some othe=
r
> build issues, I haven't pushed it yet.
>
> Hopefully in the next day or so, I'll get everything pushed.
>
> Bruce
>
> On Thu, Sep 28, 2017 at 4:08 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
>>
>> Ping
>>
>>
>>
>> =E5=9C=A8 2017=E5=B9=B409=E6=9C=8822=E6=97=A5 10:03, Yi Zhao =E5=86=99=
=E9=81=93:
>>>
>>> CVE-2017-7506: spice versions though 0.13 are vulnerable to
>>> out-of-bounds memory access when processing specially crafted messages
>>> from authenticated attacker to the spice server resulting into crash
>>> and/or server memory leak.
>>>
>>> Reference:
>>> https://nvd.nist.gov/vuln/detail/CVE-2017-7506
>>>
>>> Patches from:
>>>
>>> https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&id=3Df1e7ec03=
e26ab6b8ca9b7ec060846a5b706a963d
>>>
>>> https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&id=3Dec6229c7=
9abe05d731953df5f7e9a05ec9f6df79
>>>
>>> https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&id=3Da957a90b=
af2c62d31f3547e56bba7d0e812d2331
>>>
>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> ---
>>>   recipes-support/spice/files/CVE-2017-7506-1.patch | 81
>>> +++++++++++++++++++++++
>>>   recipes-support/spice/files/CVE-2017-7506-2.patch | 37 +++++++++++
>>>   recipes-support/spice/files/CVE-2017-7506-3.patch | 54 ++++++++++++++=
+
>>>   recipes-support/spice/spice_git.bb                |  3 +
>>>   4 files changed, 175 insertions(+)
>>>   create mode 100644 recipes-support/spice/files/CVE-2017-7506-1.patch
>>>   create mode 100644 recipes-support/spice/files/CVE-2017-7506-2.patch
>>>   create mode 100644 recipes-support/spice/files/CVE-2017-7506-3.patch
>>>
>>> diff --git a/recipes-support/spice/files/CVE-2017-7506-1.patch
>>> b/recipes-support/spice/files/CVE-2017-7506-1.patch
>>> new file mode 100644
>>> index 0000000..1975aca
>>> --- /dev/null
>>> +++ b/recipes-support/spice/files/CVE-2017-7506-1.patch
>>> @@ -0,0 +1,81 @@
>>> +From 2e521a9db27e1ed31bf5fbed437208bf7f1c77a1 Mon Sep 17 00:00:00 2001
>>> +From: Frediano Ziglio <fziglio@redhat.com>
>>> +Date: Mon, 15 May 2017 15:57:28 +0100
>>> +Subject: [PATCH 1/3] reds: Disconnect when receiving overly big
>>> + ClientMonitorsConfig
>>> +
>>> +Total message size received from the client was unlimited. There is
>>> +a 2kiB size check on individual agent messages, but the MonitorsConfig
>>> +message can be split in multiple chunks, and the size of the
>>> +non-chunked MonitorsConfig message was never checked. This could easil=
y
>>> +lead to memory exhaustion on the host.
>>> +
>>> +Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
>>> +
>>> +Upstream-Status: Backport
>>>
>>> +[https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&id=3Df1e7ec=
03e26ab6b8ca9b7ec060846a5b706a963d]
>>> +
>>> +CVE: CVE-2017-7506
>>> +
>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> +---
>>> + server/reds.c | 25 +++++++++++++++++++++++--
>>> + 1 file changed, 23 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/server/reds.c b/server/reds.c
>>> +index 30d0652..701d5d8 100644
>>> +--- a/server/reds.c
>>> ++++ b/server/reds.c
>>> +@@ -1086,19 +1086,34 @@ static void
>>> reds_client_monitors_config_cleanup(void)
>>> + static void reds_on_main_agent_monitors_config(
>>> +         MainChannelClient *mcc, void *message, size_t size)
>>> + {
>>> ++    const unsigned int MAX_MONITORS =3D 256;
>>> ++    const unsigned int MAX_MONITOR_CONFIG_SIZE =3D
>>> ++       sizeof(VDAgentMonitorsConfig) + MAX_MONITORS *
>>> sizeof(VDAgentMonConfig);
>>> ++
>>> +     VDAgentMessage *msg_header;
>>> +     VDAgentMonitorsConfig *monitors_config;
>>> +     RedsClientMonitorsConfig *cmc =3D &reds->client_monitors_config;
>>> +
>>> ++    // limit size of message sent by the client as this can cause a D=
oS
>>> through
>>> ++    // memory exhaustion, or potentially some integer overflows
>>> ++    if (sizeof(VDAgentMessage) + MAX_MONITOR_CONFIG_SIZE -
>>> cmc->buffer_size < size) {
>>> ++        goto overflow;
>>> ++    }
>>> +     cmc->buffer_size +=3D size;
>>> +     cmc->buffer =3D realloc(cmc->buffer, cmc->buffer_size);
>>> +     spice_assert(cmc->buffer);
>>> +     cmc->mcc =3D mcc;
>>> +     memcpy(cmc->buffer + cmc->buffer_pos, message, size);
>>> +     cmc->buffer_pos +=3D size;
>>> ++    if (sizeof(VDAgentMessage) > cmc->buffer_size) {
>>> ++        spice_debug("not enough data yet. %d", cmc->buffer_size);
>>> ++        return;
>>> ++    }
>>> +     msg_header =3D (VDAgentMessage *)cmc->buffer;
>>> +-    if (sizeof(VDAgentMessage) > cmc->buffer_size ||
>>> +-            msg_header->size > cmc->buffer_size -
>>> sizeof(VDAgentMessage)) {
>>> ++    if (msg_header->size > MAX_MONITOR_CONFIG_SIZE) {
>>> ++        goto overflow;
>>> ++    }
>>> ++    if (msg_header->size > cmc->buffer_size - sizeof(VDAgentMessage))=
 {
>>> +         spice_debug("not enough data yet. %d\n", cmc->buffer_size);
>>> +         return;
>>> +     }
>>> +@@ -1106,6 +1121,12 @@ static void reds_on_main_agent_monitors_config(
>>> +     spice_debug("%s: %d\n", __func__,
>>> monitors_config->num_of_monitors);
>>> +     red_dispatcher_client_monitors_config(monitors_config);
>>> +     reds_client_monitors_config_cleanup();
>>> ++    return;
>>> ++
>>> ++overflow:
>>> ++    spice_warning("received invalid MonitorsConfig request from clien=
t,
>>> disconnecting");
>>> ++    red_channel_client_disconnect(main_channel_client_get_base(mcc));
>>> ++    reds_client_monitors_config_cleanup();
>>> + }
>>> +
>>> + void reds_on_main_agent_data(MainChannelClient *mcc, void *message,
>>> size_t size)
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/recipes-support/spice/files/CVE-2017-7506-2.patch
>>> b/recipes-support/spice/files/CVE-2017-7506-2.patch
>>> new file mode 100644
>>> index 0000000..a517b08
>>> --- /dev/null
>>> +++ b/recipes-support/spice/files/CVE-2017-7506-2.patch
>>> @@ -0,0 +1,37 @@
>>> +From 6934f036240753a14514a71ede8bb44af2043f24 Mon Sep 17 00:00:00 2001
>>> +From: Frediano Ziglio <fziglio@redhat.com>
>>> +Date: Mon, 15 May 2017 15:57:28 +0100
>>> +Subject: [PATCH 2/3] reds: Avoid integer overflows handling monitor
>>> + configuration
>>> +
>>> +Avoid VDAgentMessage::size integer overflows.
>>> +
>>> +Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
>>> +
>>> +Upstream-Status: Backport
>>>
>>> +[https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&id=3Dec6229=
c79abe05d731953df5f7e9a05ec9f6df79]
>>> +
>>> +CVE: CVE-2017-7506
>>> +
>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> +---
>>> + server/reds.c | 3 +++
>>> + 1 file changed, 3 insertions(+)
>>> +
>>> +diff --git a/server/reds.c b/server/reds.c
>>> +index 701d5d8..62b1164 100644
>>> +--- a/server/reds.c
>>> ++++ b/server/reds.c
>>> +@@ -1117,6 +1117,9 @@ static void reds_on_main_agent_monitors_config(
>>> +         spice_debug("not enough data yet. %d\n", cmc->buffer_size);
>>> +         return;
>>> +     }
>>> ++    if (msg_header->size < sizeof(VDAgentMonitorsConfig)) {
>>> ++        goto overflow;
>>> ++    }
>>> +     monitors_config =3D (VDAgentMonitorsConfig *)(cmc->buffer +
>>> sizeof(*msg_header));
>>> +     spice_debug("%s: %d\n", __func__,
>>> monitors_config->num_of_monitors);
>>> +     red_dispatcher_client_monitors_config(monitors_config);
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/recipes-support/spice/files/CVE-2017-7506-3.patch
>>> b/recipes-support/spice/files/CVE-2017-7506-3.patch
>>> new file mode 100644
>>> index 0000000..d55502f
>>> --- /dev/null
>>> +++ b/recipes-support/spice/files/CVE-2017-7506-3.patch
>>> @@ -0,0 +1,54 @@
>>> +From daedc2e2bb70f7cb0eafd65fd37fd73af12df770 Mon Sep 17 00:00:00 2001
>>> +From: Frediano Ziglio <fziglio@redhat.com>
>>> +Date: Mon, 15 May 2017 15:57:28 +0100
>>> +Subject: [PATCH 3/3] reds: Avoid buffer overflows handling monitor
>>> + configuration
>>> +
>>> +It was also possible for a malicious client to set
>>> +VDAgentMonitorsConfig::num_of_monitors to a number larger
>>> +than the actual size of VDAgentMOnitorsConfig::monitors.
>>> +This would lead to buffer overflows, which could allow the guest to
>>> +read part of the host memory. This might cause write overflows in the
>>> +host as well, but controlling the content of such buffers seems
>>> +complicated.
>>> +
>>> +Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
>>> +
>>> +Upstream-Status: Backport
>>>
>>> +[https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&id=3Da957a9=
0baf2c62d31f3547e56bba7d0e812d2331]
>>> +
>>> +CVE: CVE-2017-7506
>>> +
>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> +---
>>> + server/reds.c | 7 +++++++
>>> + 1 file changed, 7 insertions(+)
>>> +
>>> +diff --git a/server/reds.c b/server/reds.c
>>> +index 62b1164..ee36dec 100644
>>> +--- a/server/reds.c
>>> ++++ b/server/reds.c
>>> +@@ -1093,6 +1093,7 @@ static void reds_on_main_agent_monitors_config(
>>> +     VDAgentMessage *msg_header;
>>> +     VDAgentMonitorsConfig *monitors_config;
>>> +     RedsClientMonitorsConfig *cmc =3D &reds->client_monitors_config;
>>> ++    uint32_t max_monitors;
>>> +
>>> +     // limit size of message sent by the client as this can cause a D=
oS
>>> through
>>> +     // memory exhaustion, or potentially some integer overflows
>>> +@@ -1121,6 +1122,12 @@ static void reds_on_main_agent_monitors_config(
>>> +         goto overflow;
>>> +     }
>>> +     monitors_config =3D (VDAgentMonitorsConfig *)(cmc->buffer +
>>> sizeof(*msg_header));
>>> ++    // limit the monitor number to avoid buffer overflows
>>> ++    max_monitors =3D (msg_header->size - sizeof(VDAgentMonitorsConfig=
)) /
>>> ++                   sizeof(VDAgentMonConfig);
>>> ++    if (monitors_config->num_of_monitors > max_monitors) {
>>> ++        goto overflow;
>>> ++    }
>>> +     spice_debug("%s: %d\n", __func__,
>>> monitors_config->num_of_monitors);
>>> +     red_dispatcher_client_monitors_config(monitors_config);
>>> +     reds_client_monitors_config_cleanup();
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/recipes-support/spice/spice_git.bb
>>> b/recipes-support/spice/spice_git.bb
>>> index 04e7a25..c0fdd9c 100644
>>> --- a/recipes-support/spice/spice_git.bb
>>> +++ b/recipes-support/spice/spice_git.bb
>>> @@ -38,6 +38,9 @@ SRC_URI +=3D " \
>>>
>>> file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch =
\
>>>
>>> file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch =
\
>>>           file://Fix-build-issues-with-gcc-7.patch \
>>> +        file://CVE-2017-7506-1.patch \
>>> +        file://CVE-2017-7506-2.patch \
>>> +        file://CVE-2017-7506-3.patch \
>>>           "
>>>     S =3D "${WORKDIR}/git"
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at
> its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

