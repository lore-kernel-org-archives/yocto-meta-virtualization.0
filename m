Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10852.1793711767398434655
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Nov 2026 05:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=EIIRMlG7;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: tanguy.raufflet@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C1F463D81817;
	Tue,  3 Nov 2026 08:16:05 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ITkm-IgXKde1; Tue,  3 Nov 2026 08:16:03 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E25183D817F8;
	Tue,  3 Nov 2026 08:16:02 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E25183D817F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793711762; bh=T7/yWXmu5NaKlpfnvZ/fc8aeaLFuSKwe3w4b6TQJ9Ic=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=EIIRMlG7DPdh5+2dTJT+QsrPkXSW2+oOQaeUwrJ36UPhQB+i4hX1ovIuc2fXD0EEr
	 anErMcKnqSbr0IQhQOqd9C8psTwZVBFfikV6zPHvW1PPVOe/Oza9S1oog/rTiudLM9
	 ijW9w1aoxqpzKW4+HRs3GiJhpn8lPV2kuEiIEd10ofkdKjRZud+FKSUcKfl4drcaoM
	 l9G+kpFfrxMkSSKIujOUnLGjwnSBVxd/1LmEQmMKFJpmSkIgwKOKzIcdxWLFAH/vt0
	 FmJoVB+Ft6TGsUoQFpjonJgq2TE9/lXXFbxXJr89FdNKc0rRrnpCqUJHs67uIiJ+CO
	 q6CvaDRACEsRQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id lTZB40lZiYVO; Tue,  3 Nov 2026 08:16:02 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9098A3D817FC;
	Tue,  3 Nov 2026 08:16:02 -0500 (EST)
Date: Tue, 3 Nov 2026 08:16:02 -0500 (EST)
From: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Message-ID: <1074218742.1918618.1793711762503.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <6ada5b42.4bcc4235.70a25.8048@mx.google.com>
References: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com> <6abd3113.e51cd04b.1fe4c8.0684@mx.google.com> <1760387508.1766093.1791807841997.JavaMail.zimbra@savoirfairelinux.com> <6ada5b42.4bcc4235.70a25.8048@mx.google.com>
Subject: Re: [meta-virtualization][PATCH 1/2] image-oci: add OCI runtime
 bundle output
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="=_e1e4a3fb-d296-4319-afac-6ee57d0db63e"
X-Mailer: Zimbra 10.1.20_GA_0326 (ZimbraWebClient - FF159 (Linux)/10.1.20_GA_0326)
X-Zimbra-Message-Verification: hash=SHA256;guid=MDcwM2VmZDRiYWEyOTBiMTRmM2JmNmMzMzgzZjUxNTg3Y2RlZGNhNTI5NjcyM2E4YjdlNmVkOGNlZjA3Y2ViZA==
Thread-Topic: image-oci: add OCI runtime bundle output
Thread-Index: ByD4tZQE95I3k2Z7nf3tAcei4kFHzA==
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Nov 2026 13:16:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10144

--=_e1e4a3fb-d296-4319-afac-6ee57d0db63e
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bruce,=20

> image-oci already produces a runnable OCI runtime bundle during the
> build. The umoci backend creates ${IMAGE_NAME}-oci-bundle/ with a
> flat rootfs/ and config.json as a working intermediate (see
> classes/image-oci-umoci.inc, the image_bundle_name variable). The
> final rm at the end is the only thing that stops it being a
> first-class output. The top-of-file docstring in
> classes/image-oci.bbclass has walked through this flow since 2021,
> including "runc run -b container-base-oci-bundle ctr-build" as the
> canonical runnable form -- the capability has been there, it just
> hasn't been exposed as a shippable artifact when using umoci.
We=E2=80=99d be happy to contribute follow-up enhancements once you=E2=80=
=99ve pushed=20
your WIP branch. In the meantime, we=E2=80=99d also be glad to help test th=
e=20
changes or review before merging.=20

> So what I'm going to do:

> 1. Reinstate the historical dual-form tar convention described in the
> umoci backend's comment block at classes/image-oci-umoci.inc. The
> .tar form (not -dir.tar) carries blobs/, oci-layout, index.json AND
> top-level rootfs/, config.json together, so extracting it gives
> both the OCI layout and a runnable bundle side by side. The current
> code only tars the layout contents; the comment is accurate for the
> intent, the code drifted. Fix: preserve $image_bundle_name through
> the tar step and include its contents in $image_name.tar.

> Both backends (umoci and sloci) will honor the same convention.
> Multi-layer squashing is a free consequence of umoci's own
> unpack-after-each-layer-repack flow -- the final bundle rootfs
> already reflects the full stacked tree flat.

> Rather than making this opt-in, this becomes the default output
> going forward for new builds, with the layout-only -dir.tar form
> preserved so existing users don't break.
It sounds like this will significantly increase the output size, which woul=
d=20
now contain the same rootfs in two formats (OCI blobs and bundle).=20
Won't this affect existing users?=20
> 3. First-class runtime-spec recipe variables for the fields you
> actually need to configure: mounts, capabilities, namespaces,
> readonly rootfs, no-new-privileges, resource limits as they
> surface, etc. These live in image-oci as regular recipe
> variables that control what gets emitted into config.json during
> the umoci / sloci build, so the recipe fully describes the
> container's identity end-to-end. We already have OCI_IMAGE_* for
> the image-spec fields (env, cmd, entrypoint, workingdir, user,
> labels, ports); the runtime-spec additions are the natural
> extension. Naming (keep OCI_IMAGE_* for coherence vs. introduce
> OCI_BUNDLE_* for strict spec-family hygiene) is still something
> I need to decide.

> If this plan matches what you need, can you send a list of the
> variables that you've identified as needed ? Along with expected
> runtime results (if any) .. and with that, I can test what I've
> pulled together in my WIP branches.

Thanks for the detailed explanation. Yes, this plan matches our goal.=20
We will just need to untar before using the flat rootfs and its runtime=20
configuration file.=20

Based on our current config.json, the runtime settings we would like=20
to express through recipe variables are listed=20
below. The OCI*BUNDLE*\* names are only suggestions:=20

- OCI_BUNDLE_MOUNTS: declare source, destination, type, and option=20
for each mount. For example, a read-only bind mount should appear at=20
the requested container path and reject writes.=20

- OCI_BUNDLE_CAPABILITIES_<properties>: explicitly control the=20
capability sets in process.capabilities, including an empty set.=20
The process should receive only the capabilities declared by the recipe.=20

- OCI_BUNDLE_NAMESPACES: select private namespaces or join=20
existing ones by path. For example, a private PID namespace should=20
isolate the process view, while omitting the network namespace should=20
retain the host network namespace.=20

Also, because umoci provides a default list for namespaces and=20
mountpoints, OCI_BUNDLE_NAMESPACES and OCI=20
BUNDLE_MOUNTS should override the default list when provided and=20
not append to it, because we want to trim the defaults down in some=20
cases.=20

- OCI_BUNDLE_RLIMITS: configure process.rlimits, including the type=20
and soft/hard limits.=20

- OCI_BUNDLE_HOSTNAME: configure the runtime hostname in a=20
private UTS namespace. The hostname observed inside the container=20
should match the recipe setting without changing the host's hostname.=20

- OCI_BUNDLE_UID_MAPPINGS / OCI_BUNDLE_GID_MAPPINGS:=20
configure linux.uidMappings and linux.gidMappings, including=20
containerID, hostID, and size for each mapping.=20

- OCI_BUNDLE_MASKED_PATHS: configure linux.maskedPaths.=20
Paths such as /proc/kcore should be masked inside the container=20
without affecting the host's view.=20

- OCI_BUNDLE_READONLY_PATHS: configure linux.readonlyPaths.=20
Paths such as /proc/sys should remain readable but reject writes inside=20
the container.=20

- OCI_BUNDLE_NO_NEW_PRIVILEGES: configure process.noNewPrivileges.=20

For entrypoint and default arguments, OCI_IMAGE_ENTRYPOINT and=20
OCI_IMAGE_CMD already provide the image-level settings. These=20
variables should drive the emitted bundle's process.args to reflect those=
=20
finalized settings. In the current umoci backend, they are applied after=20
the bundle is unpacked, so the intermediate bundle's config.json does=20
not yet reflect these settings.=20

Also, our container config.json needs to hold template fields that will be=
=20
filled at installation. Example: a mountpoint to an instance's specific dat=
a=20
directory. The proposal sounds compatible, we can use a placeholder like=20
@INSTANCE_DIR@ in the variables and need to do our post-processing=20
at runtime.=20

Additional runtime settings not listed above may also need to be overridden=
=20
by downstream users (e.g., apparmorProfile, oomScoreAdj, scheduler=20
settings, and hooks). The complete list of configuration options is defined=
=20
in the OCI Runtime Specification:=20
[ https://github.com/opencontainers/runtime-spec/blob/main/config.md | http=
s://github.com/opencontainers/runtime-spec/blob/main/config.md ]=20

Thanks,=20
Tanguy=20

--=_e1e4a3fb-d296-4319-afac-6ee57d0db63e
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial,helvetica,sans-serif; font-siz=
e: 12pt; color: #000000"><div data-marker=3D"__QUOTED_TEXT__"><div>Hi Bruce=
,</div><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5px;p=
adding-left:5px;color:#000;font-weight:normal;font-style:normal;text-decora=
tion:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;">image-oci=
 already produces a runnable OCI runtime bundle during the<br>build. The um=
oci backend creates ${IMAGE_NAME}-oci-bundle/ with a<br>flat rootfs/ and co=
nfig.json as a working intermediate (see<br>classes/image-oci-umoci.inc, th=
e image_bundle_name variable). The<br>final rm at the end is the only thing=
 that stops it being a<br>first-class output. The top-of-file docstring in<=
br>classes/image-oci.bbclass has walked through this flow since 2021,<br>in=
cluding "runc run -b container-base-oci-bundle ctr-build" as the<br>canonic=
al runnable form -- the capability has been there, it just<br>hasn't been e=
xposed as a shippable artifact when using umoci.</blockquote><div>We=E2=80=
=99d be happy to contribute follow-up enhancements once you=E2=80=99ve push=
ed</div><div>your WIP branch. In the meantime, we=E2=80=99d also be glad to=
 help test the</div><div>changes or review before merging.</div><blockquote=
 style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;co=
lor:#000;font-weight:normal;font-style:normal;text-decoration:none;font-fam=
ily:Helvetica,Arial,sans-serif;font-size:12pt;"><br><br>So what I'm going t=
o do:<br><br>1. Reinstate the historical dual-form tar convention described=
 in the<br>&nbsp;&nbsp; umoci backend's comment block at classes/image-oci-=
umoci.inc. &nbsp;The<br>&nbsp;&nbsp; .tar form (not -dir.tar) carries blobs=
/, oci-layout, index.json AND<br>&nbsp;&nbsp; top-level rootfs/, config.jso=
n together, so extracting it gives<br>&nbsp;&nbsp; both the OCI layout and =
a runnable bundle side by side. The current<br>&nbsp;&nbsp; code only tars =
the layout contents; the comment is accurate for the<br>&nbsp;&nbsp; intent=
, the code drifted. Fix: preserve $image_bundle_name through<br>&nbsp;&nbsp=
; the tar step and include its contents in $image_name.tar.<br><br>&nbsp;&n=
bsp; Both backends (umoci and sloci) will honor the same convention.<br>&nb=
sp;&nbsp; Multi-layer squashing is a free consequence of umoci's own<br>&nb=
sp;&nbsp; unpack-after-each-layer-repack flow -- the final bundle rootfs<br=
>&nbsp;&nbsp; already reflects the full stacked tree flat.<br><br>&nbsp;&nb=
sp; Rather than making this opt-in, this becomes the default output<br>&nbs=
p;&nbsp; going forward for new builds, with the layout-only -dir.tar form<b=
r>&nbsp;&nbsp; preserved so existing users don't break.</blockquote>It soun=
ds like this will significantly increase the output size, which would</div>=
<div data-marker=3D"__QUOTED_TEXT__">now contain the same rootfs in two for=
mats (OCI blobs and bundle).</div><div data-marker=3D"__QUOTED_TEXT__">Won'=
t this affect existing users?<blockquote style=3D"border-left:2px solid #10=
10FF;margin-left:5px;padding-left:5px;color:#000;font-weight:normal;font-st=
yle:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font=
-size:12pt;"><br>3. First-class runtime-spec recipe variables for the field=
s you<br>&nbsp;&nbsp; actually need to configure: mounts, capabilities, nam=
espaces,<br>&nbsp;&nbsp; readonly rootfs, no-new-privileges, resource limit=
s as they<br>&nbsp;&nbsp; surface, etc. These live in image-oci as regular =
recipe<br>&nbsp;&nbsp; variables that control what gets emitted into config=
.json during<br>&nbsp;&nbsp; the umoci / sloci build, so the recipe fully d=
escribes the<br>&nbsp;&nbsp; container's identity end-to-end. We already ha=
ve OCI_IMAGE_* for<br>&nbsp;&nbsp; the image-spec fields (env, cmd, entrypo=
int, workingdir, user,<br>&nbsp;&nbsp; labels, ports); the runtime-spec add=
itions are the natural<br>&nbsp;&nbsp; extension. Naming (keep OCI_IMAGE_* =
for coherence vs. introduce<br>&nbsp;&nbsp; OCI_BUNDLE_* for strict spec-fa=
mily hygiene) is still something<br>&nbsp;&nbsp; I need to decide.<br><br>I=
f this plan matches what you need, can you send a list of the<br>variables =
that you've identified as needed ? Along with expected<br>runtime results (=
if any) .. and with that, I can test what I've<br>pulled together in my WIP=
 branches.<br></blockquote>Thanks for the detailed explanation. Yes, this p=
lan matches our goal.</div><div data-marker=3D"__QUOTED_TEXT__">We will jus=
t need to untar before using the flat rootfs and its runtime</div><div data=
-marker=3D"__QUOTED_TEXT__">configuration file.</div><div data-marker=3D"__=
QUOTED_TEXT__"><br data-mce-bogus=3D"1"></div><div data-marker=3D"__QUOTED_=
TEXT__"><div>Based on our current config.json, the runtime settings we woul=
d like</div><div>to express through recipe variables are listed<br>below. T=
he OCI*BUNDLE*\* names are only suggestions:<br><br>- OCI_BUNDLE_MOUNTS: de=
clare source, destination, type, and option</div><div>&nbsp; for each mount=
. For example, a read-only bind mount should appear at</div><div>&nbsp; the=
 requested container path and reject writes.<br></div><div><div style=3D"fo=
nt-family: arial, helvetica, sans-serif; font-size: 12pt;" data-mce-style=
=3D"font-family: arial, helvetica, sans-serif; font-size: 12pt;"><div style=
=3D"font-family: arial, helvetica, sans-serif; font-size: 12pt;" data-mce-s=
tyle=3D"font-family: arial, helvetica, sans-serif; font-size: 12pt;"><div><=
div><br>- OCI_BUNDLE_CAPABILITIES_&lt;properties&gt;: explicitly control th=
e</div><div>&nbsp; capability sets in process.capabilities, including an em=
pty set.</div><div>&nbsp; The process should receive only the capabilities =
declared by the recipe.</div></div></div></div><div style=3D"font-family: a=
rial, helvetica, sans-serif; font-size: 12pt;" data-mce-style=3D"font-famil=
y: arial, helvetica, sans-serif; font-size: 12pt;"><div style=3D"font-famil=
y: arial, helvetica, sans-serif; font-size: 12pt;" data-mce-style=3D"font-f=
amily: arial, helvetica, sans-serif; font-size: 12pt;"><div><div><br>- OCI_=
BUNDLE_NAMESPACES: select private namespaces or join</div><div>&nbsp; exist=
ing ones by path. For example, a private PID namespace should</div><div>&nb=
sp; isolate the process view, while omitting the network namespace should<b=
r>&nbsp; retain the host network namespace.</div><div><br data-mce-bogus=3D=
"1"></div><div>&nbsp; Also, because umoci provides a default list for names=
paces and</div><div>&nbsp; mountpoints, OCI_BUNDLE_NAMESPACES and OCI</div>=
<div>&nbsp; BUNDLE_MOUNTS should override the default list when provided an=
d</div><div>&nbsp; not append to it, because we want to trim the defaults d=
own in some</div><div>&nbsp; cases.</div></div></div></div><div style=3D"fo=
nt-family: arial, helvetica, sans-serif; font-size: 12pt;" data-mce-style=
=3D"font-family: arial, helvetica, sans-serif; font-size: 12pt;"><div style=
=3D"font-family: arial, helvetica, sans-serif; font-size: 12pt;" data-mce-s=
tyle=3D"font-family: arial, helvetica, sans-serif; font-size: 12pt;"><div><=
div><br>- OCI_BUNDLE_RLIMITS: configure process.rlimits, including the type=
</div><div>&nbsp; and soft/hard limits.<br><br>- OCI_BUNDLE_HOSTNAME: confi=
gure the runtime hostname in a</div><div>&nbsp; private UTS namespace. The =
hostname observed inside the container</div><div>&nbsp; should match the re=
cipe setting without changing the host's hostname.<br><br>- OCI_BUNDLE_UID_=
MAPPINGS / OCI_BUNDLE_GID_MAPPINGS:</div><div>&nbsp; configure linux.uidMap=
pings and linux.gidMappings, including</div><div>&nbsp; containerID, hostID=
, and size for each mapping.<br><br>- OCI_BUNDLE_MASKED_PATHS: configure li=
nux.maskedPaths.<br>&nbsp; Paths such as /proc/kcore should be masked insid=
e the container</div><div>&nbsp; without affecting the host's view.<br><br>=
- OCI_BUNDLE_READONLY_PATHS: configure linux.readonlyPaths.<br>&nbsp; Paths=
 such as /proc/sys should remain readable but reject writes inside</div><di=
v>&nbsp; the container.<br><br>- OCI_BUNDLE_NO_NEW_PRIVILEGES: configure pr=
ocess.noNewPrivileges.<br><br>For entrypoint and default arguments, OCI_IMA=
GE_ENTRYPOINT and</div><div>OCI_IMAGE_CMD already provide the image-level s=
ettings. These</div><div>variables should drive the emitted bundle's proces=
s.args to reflect those</div><div>finalized settings. In the current umoci =
backend, they are applied after</div><div>the bundle is unpacked, so the in=
termediate bundle's config.json does<br>not yet reflect these settings.</di=
v><div><br data-mce-bogus=3D"1"></div><div>Also, our container config.json =
needs to hold template fields that will be</div><div>filled at installation=
. Example: a mountpoint to an instance's specific data</div><div>directory.=
 The proposal sounds compatible, we can use a placeholder like</div><div>@I=
NSTANCE_DIR@ in the variables and need to do our post-processing</div><div>=
at runtime.</div><div><br data-mce-bogus=3D"1"></div>Additional runtime set=
tings not listed above may also need to be overridden</div><div>by downstre=
am users (e.g., apparmorProfile, oomScoreAdj, scheduler</div><div>settings,=
 and hooks). The complete list of configuration options is defined </div><d=
iv>in the OCI Runtime Specification:<div><span class=3D"Object" role=3D"lin=
k" id=3D"OBJ_PREFIX_DWT1917_com_zimbra_url"><a href=3D"https://github.com/o=
pencontainers/runtime-spec/blob/main/config.md" target=3D"_blank" rel=3D"no=
follow noopener noreferrer" data-mce-href=3D"https://github.com/opencontain=
ers/runtime-spec/blob/main/config.md">https://github.com/opencontainers/run=
time-spec/blob/main/config.md</a></span><br data-mce-bogus=3D"1"></div><div=
><br data-mce-bogus=3D"1"></div><div>Thanks,</div><div>Tanguy</div></div></=
div></div></div></div></div></body></html>
--=_e1e4a3fb-d296-4319-afac-6ee57d0db63e--
