Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8349E00CF5; Thu, 28 Sep 2017 05:35:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.175 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA674E00CD4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Sep 2017 05:35:14 -0700 (PDT)
Received: by mail-qt0-f175.google.com with SMTP id i13so1353821qtc.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Sep 2017 05:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PjcHDdfQrZHz/WphvyeZx4eqUc2ilKgkyJ1d66R0F0g=;
	b=gIE0EottacFvyPyK0LFdkDFGwO76krRihAqub4pA1zkgyiXFmSyDBDCUquDoLXzX7a
	xTYu5XjdxUqx2I6YceqhGOvqbmyWTVot34kU25u95XG7IG/hReLxJL3q6XKqvWPqd2Gc
	/tOx93f4VOjzPzMhXqI9BJd+gpUEeCPNX7kF6oBQ/nsmmjhS2eUcD6BycF8DuDlQIZ0N
	3NaTLOp+7yDnjUn8JA7U7umycAcSyRWzwarksqMK0TR4HJc/teAFD8fGEPENBIi82IXb
	o3s5wUoky7lSlZdG6T/nIcG6GNHeC3n5fnBQ75kv05WlXFgfi4NcssrLzuWJPaWEsEPl
	6YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PjcHDdfQrZHz/WphvyeZx4eqUc2ilKgkyJ1d66R0F0g=;
	b=jbARNCStq2DWvEjt9yAkomHWBtE2TcpI+TVbimF0GHK0nLcnyn/tkWifmxQQgk3UPX
	3jneTq8A6N7+T9Ppl1PwDDKbUIT2VKfgnrDxsCRNlvbm42gdWIq7TIlCz06OoZap4eWo
	rRWKInUqxYzx9sw3O00frtpcT8gIfJJi5dcfRLavBDk1p44D3TJObsDpElckBTVz+SYr
	DO1hvRyUOIqsCt1smN2uoP2RAMPBboLtoV9STzVsJUWQDERUIckKqxQWMah39XXU9UjI
	/7EubMhsZdOSYjVRUPZsfRvv+n+dFfLeXb+lnV95Io1YXyh0Lo1w74OAVOSMrpLMbZ6q
	oCcg==
X-Gm-Message-State: AMCzsaXZLvyECeVJrEDxh+bpyCJQtzQrcBRVWINchxoWuoLlI9EFhoCB
	1c9YNgBSx0gsjdwRCaApQbm59c8GyFv23xvLD/g=
X-Google-Smtp-Source: AOwi7QCgpSylhNpX0RWa70jgoUvZIsBFxQtExa6PeqHANuUs6RqYsz2Nzg2o8G6F/b4kGk1csJ+MPyU+H9nfXxgB6kQ=
X-Received: by 10.200.51.69 with SMTP id u5mr643137qta.204.1506602113666; Thu,
	28 Sep 2017 05:35:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Thu, 28 Sep 2017 05:35:12 -0700 (PDT)
In-Reply-To: <e4fb3507-4cff-e46e-6009-2ff6a2a3d7d7@windriver.com>
References: <1506045785-4157-1-git-send-email-yi.zhao@windriver.com>
	<e4fb3507-4cff-e46e-6009-2ff6a2a3d7d7@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Sep 2017 08:35:12 -0400
Message-ID: <CADkTA4PqTHeL4BUpyNrEgZAqPNzyL3CcBgmruRf7gRP1Oc2kpg@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Sep 2017 12:35:16 -0000
Content-Type: multipart/alternative; boundary="001a11434264cd920f055a3f2339"

--001a11434264cd920f055a3f2339
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for not replying, I had this staged last week, but due to some other
build issues, I haven't pushed it yet.

Hopefully in the next day or so, I'll get everything pushed.

Bruce

On Thu, Sep 28, 2017 at 4:08 AM, Yi Zhao <yi.zhao@windriver.com> wrote:

> Ping
>
>
>
> =E5=9C=A8 2017=E5=B9=B409=E6=9C=8822=E6=97=A5 10:03, Yi Zhao =E5=86=99=E9=
=81=93:
>
>> CVE-2017-7506: spice versions though 0.13 are vulnerable to
>> out-of-bounds memory access when processing specially crafted messages
>> from authenticated attacker to the spice server resulting into crash
>> and/or server memory leak.
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2017-7506
>>
>> Patches from:
>> https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&id=3Df
>> 1e7ec03e26ab6b8ca9b7ec060846a5b706a963d
>> https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&id=3De
>> c6229c79abe05d731953df5f7e9a05ec9f6df79
>> https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&id=3Da
>> 957a90baf2c62d31f3547e56bba7d0e812d2331
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   recipes-support/spice/files/CVE-2017-7506-1.patch | 81
>> +++++++++++++++++++++++
>>   recipes-support/spice/files/CVE-2017-7506-2.patch | 37 +++++++++++
>>   recipes-support/spice/files/CVE-2017-7506-3.patch | 54 +++++++++++++++
>>   recipes-support/spice/spice_git.bb                |  3 +
>>   4 files changed, 175 insertions(+)
>>   create mode 100644 recipes-support/spice/files/CVE-2017-7506-1.patch
>>   create mode 100644 recipes-support/spice/files/CVE-2017-7506-2.patch
>>   create mode 100644 recipes-support/spice/files/CVE-2017-7506-3.patch
>>
>> diff --git a/recipes-support/spice/files/CVE-2017-7506-1.patch
>> b/recipes-support/spice/files/CVE-2017-7506-1.patch
>> new file mode 100644
>> index 0000000..1975aca
>> --- /dev/null
>> +++ b/recipes-support/spice/files/CVE-2017-7506-1.patch
>> @@ -0,0 +1,81 @@
>> +From 2e521a9db27e1ed31bf5fbed437208bf7f1c77a1 Mon Sep 17 00:00:00 2001
>> +From: Frediano Ziglio <fziglio@redhat.com>
>> +Date: Mon, 15 May 2017 15:57:28 +0100
>> +Subject: [PATCH 1/3] reds: Disconnect when receiving overly big
>> + ClientMonitorsConfig
>> +
>> +Total message size received from the client was unlimited. There is
>> +a 2kiB size check on individual agent messages, but the MonitorsConfig
>> +message can be split in multiple chunks, and the size of the
>> +non-chunked MonitorsConfig message was never checked. This could easily
>> +lead to memory exhaustion on the host.
>> +
>> +Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
>> +
>> +Upstream-Status: Backport
>> +[https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&
>> id=3Df1e7ec03e26ab6b8ca9b7ec060846a5b706a963d]
>> +
>> +CVE: CVE-2017-7506
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + server/reds.c | 25 +++++++++++++++++++++++--
>> + 1 file changed, 23 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/server/reds.c b/server/reds.c
>> +index 30d0652..701d5d8 100644
>> +--- a/server/reds.c
>> ++++ b/server/reds.c
>> +@@ -1086,19 +1086,34 @@ static void reds_client_monitors_config_cl
>> eanup(void)
>> + static void reds_on_main_agent_monitors_config(
>> +         MainChannelClient *mcc, void *message, size_t size)
>> + {
>> ++    const unsigned int MAX_MONITORS =3D 256;
>> ++    const unsigned int MAX_MONITOR_CONFIG_SIZE =3D
>> ++       sizeof(VDAgentMonitorsConfig) + MAX_MONITORS *
>> sizeof(VDAgentMonConfig);
>> ++
>> +     VDAgentMessage *msg_header;
>> +     VDAgentMonitorsConfig *monitors_config;
>> +     RedsClientMonitorsConfig *cmc =3D &reds->client_monitors_config;
>> +
>> ++    // limit size of message sent by the client as this can cause a Do=
S
>> through
>> ++    // memory exhaustion, or potentially some integer overflows
>> ++    if (sizeof(VDAgentMessage) + MAX_MONITOR_CONFIG_SIZE -
>> cmc->buffer_size < size) {
>> ++        goto overflow;
>> ++    }
>> +     cmc->buffer_size +=3D size;
>> +     cmc->buffer =3D realloc(cmc->buffer, cmc->buffer_size);
>> +     spice_assert(cmc->buffer);
>> +     cmc->mcc =3D mcc;
>> +     memcpy(cmc->buffer + cmc->buffer_pos, message, size);
>> +     cmc->buffer_pos +=3D size;
>> ++    if (sizeof(VDAgentMessage) > cmc->buffer_size) {
>> ++        spice_debug("not enough data yet. %d", cmc->buffer_size);
>> ++        return;
>> ++    }
>> +     msg_header =3D (VDAgentMessage *)cmc->buffer;
>> +-    if (sizeof(VDAgentMessage) > cmc->buffer_size ||
>> +-            msg_header->size > cmc->buffer_size -
>> sizeof(VDAgentMessage)) {
>> ++    if (msg_header->size > MAX_MONITOR_CONFIG_SIZE) {
>> ++        goto overflow;
>> ++    }
>> ++    if (msg_header->size > cmc->buffer_size - sizeof(VDAgentMessage)) =
{
>> +         spice_debug("not enough data yet. %d\n", cmc->buffer_size);
>> +         return;
>> +     }
>> +@@ -1106,6 +1121,12 @@ static void reds_on_main_agent_monitors_config(
>> +     spice_debug("%s: %d\n", __func__, monitors_config->num_of_monito
>> rs);
>> +     red_dispatcher_client_monitors_config(monitors_config);
>> +     reds_client_monitors_config_cleanup();
>> ++    return;
>> ++
>> ++overflow:
>> ++    spice_warning("received invalid MonitorsConfig request from client=
,
>> disconnecting");
>> ++    red_channel_client_disconnect(main_channel_client_get_base(mcc));
>> ++    reds_client_monitors_config_cleanup();
>> + }
>> +
>> + void reds_on_main_agent_data(MainChannelClient *mcc, void *message,
>> size_t size)
>> +--
>> +2.7.4
>> +
>> diff --git a/recipes-support/spice/files/CVE-2017-7506-2.patch
>> b/recipes-support/spice/files/CVE-2017-7506-2.patch
>> new file mode 100644
>> index 0000000..a517b08
>> --- /dev/null
>> +++ b/recipes-support/spice/files/CVE-2017-7506-2.patch
>> @@ -0,0 +1,37 @@
>> +From 6934f036240753a14514a71ede8bb44af2043f24 Mon Sep 17 00:00:00 2001
>> +From: Frediano Ziglio <fziglio@redhat.com>
>> +Date: Mon, 15 May 2017 15:57:28 +0100
>> +Subject: [PATCH 2/3] reds: Avoid integer overflows handling monitor
>> + configuration
>> +
>> +Avoid VDAgentMessage::size integer overflows.
>> +
>> +Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
>> +
>> +Upstream-Status: Backport
>> +[https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&
>> id=3Dec6229c79abe05d731953df5f7e9a05ec9f6df79]
>> +
>> +CVE: CVE-2017-7506
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + server/reds.c | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/server/reds.c b/server/reds.c
>> +index 701d5d8..62b1164 100644
>> +--- a/server/reds.c
>> ++++ b/server/reds.c
>> +@@ -1117,6 +1117,9 @@ static void reds_on_main_agent_monitors_config(
>> +         spice_debug("not enough data yet. %d\n", cmc->buffer_size);
>> +         return;
>> +     }
>> ++    if (msg_header->size < sizeof(VDAgentMonitorsConfig)) {
>> ++        goto overflow;
>> ++    }
>> +     monitors_config =3D (VDAgentMonitorsConfig *)(cmc->buffer +
>> sizeof(*msg_header));
>> +     spice_debug("%s: %d\n", __func__, monitors_config->num_of_monito
>> rs);
>> +     red_dispatcher_client_monitors_config(monitors_config);
>> +--
>> +2.7.4
>> +
>> diff --git a/recipes-support/spice/files/CVE-2017-7506-3.patch
>> b/recipes-support/spice/files/CVE-2017-7506-3.patch
>> new file mode 100644
>> index 0000000..d55502f
>> --- /dev/null
>> +++ b/recipes-support/spice/files/CVE-2017-7506-3.patch
>> @@ -0,0 +1,54 @@
>> +From daedc2e2bb70f7cb0eafd65fd37fd73af12df770 Mon Sep 17 00:00:00 2001
>> +From: Frediano Ziglio <fziglio@redhat.com>
>> +Date: Mon, 15 May 2017 15:57:28 +0100
>> +Subject: [PATCH 3/3] reds: Avoid buffer overflows handling monitor
>> + configuration
>> +
>> +It was also possible for a malicious client to set
>> +VDAgentMonitorsConfig::num_of_monitors to a number larger
>> +than the actual size of VDAgentMOnitorsConfig::monitors.
>> +This would lead to buffer overflows, which could allow the guest to
>> +read part of the host memory. This might cause write overflows in the
>> +host as well, but controlling the content of such buffers seems
>> +complicated.
>> +
>> +Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
>> +
>> +Upstream-Status: Backport
>> +[https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&
>> id=3Da957a90baf2c62d31f3547e56bba7d0e812d2331]
>> +
>> +CVE: CVE-2017-7506
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + server/reds.c | 7 +++++++
>> + 1 file changed, 7 insertions(+)
>> +
>> +diff --git a/server/reds.c b/server/reds.c
>> +index 62b1164..ee36dec 100644
>> +--- a/server/reds.c
>> ++++ b/server/reds.c
>> +@@ -1093,6 +1093,7 @@ static void reds_on_main_agent_monitors_config(
>> +     VDAgentMessage *msg_header;
>> +     VDAgentMonitorsConfig *monitors_config;
>> +     RedsClientMonitorsConfig *cmc =3D &reds->client_monitors_config;
>> ++    uint32_t max_monitors;
>> +
>> +     // limit size of message sent by the client as this can cause a Do=
S
>> through
>> +     // memory exhaustion, or potentially some integer overflows
>> +@@ -1121,6 +1122,12 @@ static void reds_on_main_agent_monitors_config(
>> +         goto overflow;
>> +     }
>> +     monitors_config =3D (VDAgentMonitorsConfig *)(cmc->buffer +
>> sizeof(*msg_header));
>> ++    // limit the monitor number to avoid buffer overflows
>> ++    max_monitors =3D (msg_header->size - sizeof(VDAgentMonitorsConfig)=
) /
>> ++                   sizeof(VDAgentMonConfig);
>> ++    if (monitors_config->num_of_monitors > max_monitors) {
>> ++        goto overflow;
>> ++    }
>> +     spice_debug("%s: %d\n", __func__, monitors_config->num_of_monito
>> rs);
>> +     red_dispatcher_client_monitors_config(monitors_config);
>> +     reds_client_monitors_config_cleanup();
>> +--
>> +2.7.4
>> +
>> diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/
>> spice_git.bb
>> index 04e7a25..c0fdd9c 100644
>> --- a/recipes-support/spice/spice_git.bb
>> +++ b/recipes-support/spice/spice_git.bb
>> @@ -38,6 +38,9 @@ SRC_URI +=3D " \
>>           file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-no=
t-.patch
>> \
>>           file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-bet=
we.patch
>> \
>>           file://Fix-build-issues-with-gcc-7.patch \
>> +        file://CVE-2017-7506-1.patch \
>> +        file://CVE-2017-7506-2.patch \
>> +        file://CVE-2017-7506-3.patch \
>>           "
>>     S =3D "${WORKDIR}/git"
>>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11434264cd920f055a3f2339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for not replying, I had this staged last week, but d=
ue to some other build issues, I haven&#39;t pushed it yet.<div><br></div><=
div>Hopefully in the next day or so, I&#39;ll get everything pushed.</div><=
div><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Thu, Sep 28, 2017 at 4:08 AM, Yi Zhao <span dir=3D"lt=
r">&lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping<d=
iv class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
=E5=9C=A8 2017=E5=B9=B409=E6=9C=8822=E6=97=A5 10:03, Yi Zhao =E5=86=99=E9=
=81=93:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
CVE-2017-7506: spice versions though 0.13 are vulnerable to<br>
out-of-bounds memory access when processing specially crafted messages<br>
from authenticated attacker to the spice server resulting into crash<br>
and/or server memory leak.<br>
<br>
Reference:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2017-7506" rel=3D"noreferre=
r" target=3D"_blank">https://nvd.nist.gov/vuln/deta<wbr>il/CVE-2017-7506</a=
><br>
<br>
Patches from:<br>
<a href=3D"https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&amp;id=
=3Df1e7ec03e26ab6b8ca9b7ec060846a5b706a963d" rel=3D"noreferrer" target=3D"_=
blank">https://cgit.freedesktop.org/s<wbr>pice/spice/commit/?h=3D0.12&amp;i=
d=3Df<wbr>1e7ec03e26ab6b8ca9b7ec060846a5<wbr>b706a963d</a><br>
<a href=3D"https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&amp;id=
=3Dec6229c79abe05d731953df5f7e9a05ec9f6df79" rel=3D"noreferrer" target=3D"_=
blank">https://cgit.freedesktop.org/s<wbr>pice/spice/commit/?h=3D0.12&amp;i=
d=3De<wbr>c6229c79abe05d731953df5f7e9a05<wbr>ec9f6df79</a><br>
<a href=3D"https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&amp;id=
=3Da957a90baf2c62d31f3547e56bba7d0e812d2331" rel=3D"noreferrer" target=3D"_=
blank">https://cgit.freedesktop.org/s<wbr>pice/spice/commit/?h=3D0.12&amp;i=
d=3Da<wbr>957a90baf2c62d31f3547e56bba7d0<wbr>e812d2331</a><br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0 recipes-support/spice/files/CV<wbr>E-2017-7506-1.patch | 81 ++++++++=
+++++++++++++++<br>
=C2=A0 recipes-support/spice/files/CV<wbr>E-2017-7506-2.patch | 37 ++++++++=
+++<br>
=C2=A0 recipes-support/spice/files/CV<wbr>E-2017-7506-3.patch | 54 ++++++++=
+++++++<br>
=C2=A0 recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"norefer=
rer" target=3D"_blank">spice_gi<wbr>t.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0 4 files changed, 175 insertions(+)<br>
=C2=A0 create mode 100644 recipes-support/spice/files/CV<wbr>E-2017-7506-1.=
patch<br>
=C2=A0 create mode 100644 recipes-support/spice/files/CV<wbr>E-2017-7506-2.=
patch<br>
=C2=A0 create mode 100644 recipes-support/spice/files/CV<wbr>E-2017-7506-3.=
patch<br>
<br>
diff --git a/recipes-support/spice/files/<wbr>CVE-2017-7506-1.patch b/recip=
es-support/spice/files/<wbr>CVE-2017-7506-1.patch<br>
new file mode 100644<br>
index 0000000..1975aca<br>
--- /dev/null<br>
+++ b/recipes-support/spice/files/<wbr>CVE-2017-7506-1.patch<br>
@@ -0,0 +1,81 @@<br>
+From 2e521a9db27e1ed31bf5fbed437208<wbr>bf7f1c77a1 Mon Sep 17 00:00:00 200=
1<br>
+From: Frediano Ziglio &lt;<a href=3D"mailto:fziglio@redhat.com" target=3D"=
_blank">fziglio@redhat.com</a>&gt;<br>
+Date: Mon, 15 May 2017 15:57:28 +0100<br>
+Subject: [PATCH 1/3] reds: Disconnect when receiving overly big<br>
+ ClientMonitorsConfig<br>
+<br>
+Total message size received from the client was unlimited. There is<br>
+a 2kiB size check on individual agent messages, but the MonitorsConfig<br>
+message can be split in multiple chunks, and the size of the<br>
+non-chunked MonitorsConfig message was never checked. This could easily<br=
>
+lead to memory exhaustion on the host.<br>
+<br>
+Signed-off-by: Frediano Ziglio &lt;<a href=3D"mailto:fziglio@redhat.com" t=
arget=3D"_blank">fziglio@redhat.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&amp;=
id=3Df1e7ec03e26ab6b8ca9b7ec060846a5b706a963d" rel=3D"noreferrer" target=3D=
"_blank">https://cgit.freedesktop.org<wbr>/spice/spice/commit/?h=3D0.12&amp=
;<wbr>id=3Df1e7ec03e26ab6b8ca9b7ec0608<wbr>46a5b706a963d</a>]<br>
+<br>
+CVE: CVE-2017-7506<br>
+<br>
+Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
+---<br>
+ server/reds.c | 25 +++++++++++++++++++++++--<br>
+ 1 file changed, 23 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/server/reds.c b/server/reds.c<br>
+index 30d0652..701d5d8 100644<br>
+--- a/server/reds.c<br>
++++ b/server/reds.c<br>
+@@ -1086,19 +1086,34 @@ static void reds_client_monitors_config_cl<wbr>ean=
up(void)<br>
+ static void reds_on_main_agent_monitors_co<wbr>nfig(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MainChannelClient *mcc, void *message, s=
ize_t size)<br>
+ {<br>
++=C2=A0 =C2=A0 const unsigned int MAX_MONITORS =3D 256;<br>
++=C2=A0 =C2=A0 const unsigned int MAX_MONITOR_CONFIG_SIZE =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(VDAgentMonitorsConfig) + MAX_MONITORS *=
 sizeof(VDAgentMonConfig);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0VDAgentMessage *msg_header;<br>
+=C2=A0 =C2=A0 =C2=A0VDAgentMonitorsConfig *monitors_config;<br>
+=C2=A0 =C2=A0 =C2=A0RedsClientMonitorsConfig *cmc =3D &amp;reds-&gt;client=
_monitors_config;<br>
+<br>
++=C2=A0 =C2=A0 // limit size of message sent by the client as this can cau=
se a DoS through<br>
++=C2=A0 =C2=A0 // memory exhaustion, or potentially some integer overflows=
<br>
++=C2=A0 =C2=A0 if (sizeof(VDAgentMessage) + MAX_MONITOR_CONFIG_SIZE - cmc-=
&gt;buffer_size &lt; size) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0cmc-&gt;buffer_size +=3D size;<br>
+=C2=A0 =C2=A0 =C2=A0cmc-&gt;buffer =3D realloc(cmc-&gt;buffer, cmc-&gt;buf=
fer_size);<br>
+=C2=A0 =C2=A0 =C2=A0spice_assert(cmc-&gt;buffer);<br>
+=C2=A0 =C2=A0 =C2=A0cmc-&gt;mcc =3D mcc;<br>
+=C2=A0 =C2=A0 =C2=A0memcpy(cmc-&gt;buffer + cmc-&gt;buffer_pos, message, s=
ize);<br>
+=C2=A0 =C2=A0 =C2=A0cmc-&gt;buffer_pos +=3D size;<br>
++=C2=A0 =C2=A0 if (sizeof(VDAgentMessage) &gt; cmc-&gt;buffer_size) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 spice_debug(&quot;not enough data yet. %d&quo=
t;, cmc-&gt;buffer_size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0msg_header =3D (VDAgentMessage *)cmc-&gt;buffer;<br>
+-=C2=A0 =C2=A0 if (sizeof(VDAgentMessage) &gt; cmc-&gt;buffer_size ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_header-&gt;size &gt; cmc-&g=
t;buffer_size - sizeof(VDAgentMessage)) {<br>
++=C2=A0 =C2=A0 if (msg_header-&gt;size &gt; MAX_MONITOR_CONFIG_SIZE) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 if (msg_header-&gt;size &gt; cmc-&gt;buffer_size - sizeof(V=
DAgentMessage)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spice_debug(&quot;not enough data yet. %=
d\n&quot;, cmc-&gt;buffer_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1106,6 +1121,12 @@ static void reds_on_main_agent_monitors_co<wbr>nfig=
(<br>
+=C2=A0 =C2=A0 =C2=A0spice_debug(&quot;%s: %d\n&quot;, __func__, monitors_c=
onfig-&gt;num_of_monito<wbr>rs);<br>
+=C2=A0 =C2=A0 =C2=A0red_dispatcher_client_monitor<wbr>s_config(monitors_co=
nfig);<br>
+=C2=A0 =C2=A0 =C2=A0reds_client_monitors_config_c<wbr>leanup();<br>
++=C2=A0 =C2=A0 return;<br>
++<br>
++overflow:<br>
++=C2=A0 =C2=A0 spice_warning(&quot;received invalid MonitorsConfig request=
 from client, disconnecting&quot;);<br>
++=C2=A0 =C2=A0 red_channel_client_disconnect(<wbr>main_channel_client_get_=
base(m<wbr>cc));<br>
++=C2=A0 =C2=A0 reds_client_monitors_config_cl<wbr>eanup();<br>
+ }<br>
+<br>
+ void reds_on_main_agent_data(MainCh<wbr>annelClient *mcc, void *message, =
size_t size)<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-support/spice/files/<wbr>CVE-2017-7506-2.patch b/recip=
es-support/spice/files/<wbr>CVE-2017-7506-2.patch<br>
new file mode 100644<br>
index 0000000..a517b08<br>
--- /dev/null<br>
+++ b/recipes-support/spice/files/<wbr>CVE-2017-7506-2.patch<br>
@@ -0,0 +1,37 @@<br>
+From 6934f036240753a14514a71ede8bb4<wbr>4af2043f24 Mon Sep 17 00:00:00 200=
1<br>
+From: Frediano Ziglio &lt;<a href=3D"mailto:fziglio@redhat.com" target=3D"=
_blank">fziglio@redhat.com</a>&gt;<br>
+Date: Mon, 15 May 2017 15:57:28 +0100<br>
+Subject: [PATCH 2/3] reds: Avoid integer overflows handling monitor<br>
+ configuration<br>
+<br>
+Avoid VDAgentMessage::size integer overflows.<br>
+<br>
+Signed-off-by: Frediano Ziglio &lt;<a href=3D"mailto:fziglio@redhat.com" t=
arget=3D"_blank">fziglio@redhat.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&amp;=
id=3Dec6229c79abe05d731953df5f7e9a05ec9f6df79" rel=3D"noreferrer" target=3D=
"_blank">https://cgit.freedesktop.org<wbr>/spice/spice/commit/?h=3D0.12&amp=
;<wbr>id=3Dec6229c79abe05d731953df5f7e<wbr>9a05ec9f6df79</a>]<br>
+<br>
+CVE: CVE-2017-7506<br>
+<br>
+Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
+---<br>
+ server/reds.c | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/server/reds.c b/server/reds.c<br>
+index 701d5d8..62b1164 100644<br>
+--- a/server/reds.c<br>
++++ b/server/reds.c<br>
+@@ -1117,6 +1117,9 @@ static void reds_on_main_agent_monitors_co<wbr>nfig(=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spice_debug(&quot;not enough data yet. %=
d\n&quot;, cmc-&gt;buffer_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 if (msg_header-&gt;size &lt; sizeof(VDAgentMonitorsConfig))=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0monitors_config =3D (VDAgentMonitorsConfig *)(cmc-&gt;=
buffer + sizeof(*msg_header));<br>
+=C2=A0 =C2=A0 =C2=A0spice_debug(&quot;%s: %d\n&quot;, __func__, monitors_c=
onfig-&gt;num_of_monito<wbr>rs);<br>
+=C2=A0 =C2=A0 =C2=A0red_dispatcher_client_monitor<wbr>s_config(monitors_co=
nfig);<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-support/spice/files/<wbr>CVE-2017-7506-3.patch b/recip=
es-support/spice/files/<wbr>CVE-2017-7506-3.patch<br>
new file mode 100644<br>
index 0000000..d55502f<br>
--- /dev/null<br>
+++ b/recipes-support/spice/files/<wbr>CVE-2017-7506-3.patch<br>
@@ -0,0 +1,54 @@<br>
+From daedc2e2bb70f7cb0eafd65fd37fd7<wbr>3af12df770 Mon Sep 17 00:00:00 200=
1<br>
+From: Frediano Ziglio &lt;<a href=3D"mailto:fziglio@redhat.com" target=3D"=
_blank">fziglio@redhat.com</a>&gt;<br>
+Date: Mon, 15 May 2017 15:57:28 +0100<br>
+Subject: [PATCH 3/3] reds: Avoid buffer overflows handling monitor<br>
+ configuration<br>
+<br>
+It was also possible for a malicious client to set<br>
+VDAgentMonitorsConfig::num_of<wbr>_monitors to a number larger<br>
+than the actual size of VDAgentMOnitorsConfig::monitor<wbr>s.<br>
+This would lead to buffer overflows, which could allow the guest to<br>
+read part of the host memory. This might cause write overflows in the<br>
+host as well, but controlling the content of such buffers seems<br>
+complicated.<br>
+<br>
+Signed-off-by: Frediano Ziglio &lt;<a href=3D"mailto:fziglio@redhat.com" t=
arget=3D"_blank">fziglio@redhat.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://cgit.freedesktop.org/spice/spice/commit/?h=3D0.12&amp;=
id=3Da957a90baf2c62d31f3547e56bba7d0e812d2331" rel=3D"noreferrer" target=3D=
"_blank">https://cgit.freedesktop.org<wbr>/spice/spice/commit/?h=3D0.12&amp=
;<wbr>id=3Da957a90baf2c62d31f3547e56bb<wbr>a7d0e812d2331</a>]<br>
+<br>
+CVE: CVE-2017-7506<br>
+<br>
+Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
+---<br>
+ server/reds.c | 7 +++++++<br>
+ 1 file changed, 7 insertions(+)<br>
+<br>
+diff --git a/server/reds.c b/server/reds.c<br>
+index 62b1164..ee36dec 100644<br>
+--- a/server/reds.c<br>
++++ b/server/reds.c<br>
+@@ -1093,6 +1093,7 @@ static void reds_on_main_agent_monitors_co<wbr>nfig(=
<br>
+=C2=A0 =C2=A0 =C2=A0VDAgentMessage *msg_header;<br>
+=C2=A0 =C2=A0 =C2=A0VDAgentMonitorsConfig *monitors_config;<br>
+=C2=A0 =C2=A0 =C2=A0RedsClientMonitorsConfig *cmc =3D &amp;reds-&gt;client=
_monitors_config;<br>
++=C2=A0 =C2=A0 uint32_t max_monitors;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0// limit size of message sent by the client as this ca=
n cause a DoS through<br>
+=C2=A0 =C2=A0 =C2=A0// memory exhaustion, or potentially some integer over=
flows<br>
+@@ -1121,6 +1122,12 @@ static void reds_on_main_agent_monitors_co<wbr>nfig=
(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto overflow;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0monitors_config =3D (VDAgentMonitorsConfig *)(cmc-&gt;=
buffer + sizeof(*msg_header));<br>
++=C2=A0 =C2=A0 // limit the monitor number to avoid buffer overflows<br>
++=C2=A0 =C2=A0 max_monitors =3D (msg_header-&gt;size - sizeof(VDAgentMonit=
orsConfig)) /<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size=
of(VDAgentMonConfig);<br>
++=C2=A0 =C2=A0 if (monitors_config-&gt;num_of_monit<wbr>ors &gt; max_monit=
ors) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0spice_debug(&quot;%s: %d\n&quot;, __func__, monitors_c=
onfig-&gt;num_of_monito<wbr>rs);<br>
+=C2=A0 =C2=A0 =C2=A0red_dispatcher_client_monitor<wbr>s_config(monitors_co=
nfig);<br>
+=C2=A0 =C2=A0 =C2=A0reds_client_monitors_config_c<wbr>leanup();<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">spice_<wbr>git.bb</a> b/recipes-support/spice/=
<a href=3D"http://spice_git.bb" rel=3D"noreferrer" target=3D"_blank">spice_=
<wbr>git.bb</a><br>
index 04e7a25..c0fdd9c 100644<br>
--- a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a><br>
+++ b/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a><br>
@@ -38,6 +38,9 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-red_parse_qxl-Fix-<wbr>BITMA=
P_FMT_IS_RGB-defined-but-<wbr>not-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-PRI-macros-in-<wbr>print=
f-to-keep-compatibility-b<wbr>etwe.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Fix-build-issues-with-g<wbr>cc-7.=
patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2017-7506-1.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2017-7506-2.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2017-7506-3.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0 =C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
</blockquote>
<br>
-- <br></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div>

--001a11434264cd920f055a3f2339--
