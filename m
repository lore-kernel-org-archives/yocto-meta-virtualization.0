Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64267C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 10:50:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3980.1745578233992946174
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Apr 2025 03:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6210c7caee=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P5YwD0016787
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Apr 2025 10:50:33 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh63m7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Apr 2025 10:50:32 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 25 Apr 2025 03:50:30 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 25 Apr 2025 03:50:29 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][meta-cloud-services][kirkstone][PATCH 1/1]  python3-ansible: Fix CVE-2023-5764
Date: Fri, 25 Apr 2025 10:50:25 +0000
Message-ID: <20250425105025.972837-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: kxNa4hx1eUtpMCfpAnuD5q11ZBYIgIFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3OCBTYWx0ZWRfX/asxKrPf1jsN w44WNoBNQD1FFpvliuSBZQJ8h7Jjo+AB1e++C3gzgepB1aFpM6GSIPFw4GChbUPjpA3rlbjhTCo R0KoZmGlNivLeNHzaA7fHtM2GrgCU9y5rNKCR1ZYiXiZYU7YFkRM92Ul2GhsFZ0/hHdOlrQ9yx9
 rPJDtIDwbX7Bt9oSLxozMSl7uAU/j9JpIwHWmMpXQeY5REL8xRg1SDVmGnrg2kEDRNyeQtefd7Z nQqf2l3YOH94KNrKDoFqNP6FwOGWHCFHTxQulFEEmDbJQhIjju4zQEGzj+D7BAoH/QnaYI0l5d9 e5P6khPxbT0UzyhAz3yLFqLQOtVs4IM//kKcLc7GoxCRZFED18xIfJra3i4TG4nBvOg2G3Kue2v
 W7TjINAyGrS0jyGhKHzjzSU1NsI+0V0qyBa830P32lw6QX9BzzsgmdFi8r1bZP0y+ScNIvNh
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=680b68f8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=5h67h_9zRmsA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=agvtNP_XAAAA:8 a=t7CeM3EgAAAA:8 a=LCGb1PDpAAAA:8 a=y8nsfLSz1FdnXj7Fxb0A:9 a=ZioCEcFCXNjX4sej:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bkQs350KuAgA:10 a=kPJs_spBLCwfsW1yWc_m:22 a=FdTzh2GWekK77mhwV6Dw:22 a=fdIgdzSMuGaVIbqTjZoe:22
X-Proofpoint-ORIG-GUID: kxNa4hx1eUtpMCfpAnuD5q11ZBYIgIFl
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250078
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53P5YwD0016787
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Apr 2025 10:50:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9236

From: Soumya Sambu <soumya.sambu@windriver.com>

A template injection flaw was found in Ansible where a user's controller =
internal
templating operations may remove the unsafe designation from template dat=
a. This
issue could allow an attacker to use a specially crafted file to introduc=
e templating
injection when supplying templating data.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-5764
https://security-tracker.debian.org/tracker/CVE-2023-5764

Upstream patch:
https://github.com/ansible/ansible/commit/7239d2d371bc6e274cbb7314e01431a=
dce6ae25a

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-ansible/CVE-2023-5764.patch       | 1737 +++++++++++++++++
 .../python/python3-ansible_2.14.11.bb         |    1 +
 2 files changed, 1738 insertions(+)
 create mode 100644 recipes-devtools/python/python3-ansible/CVE-2023-5764=
.patch

diff --git a/recipes-devtools/python/python3-ansible/CVE-2023-5764.patch =
b/recipes-devtools/python/python3-ansible/CVE-2023-5764.patch
new file mode 100644
index 00000000..cfc7e21e
--- /dev/null
+++ b/recipes-devtools/python/python3-ansible/CVE-2023-5764.patch
@@ -0,0 +1,1737 @@
+From 7239d2d371bc6e274cbb7314e01431adce6ae25a Mon Sep 17 00:00:00 2001
+From: Matt Martz <matt@sivel.net>
+Date: Mon, 27 Nov 2023 12:27:58 -0600
+Subject: [PATCH] Ensure that unsafe is more difficult to lose [stable-2.=
14]
+ (#82295)
+
+* Ensure that unsafe is more difficult to lose
+
+* Add Task.untemplated_args, and switch assert over to use it
+* Don't use re in first_found, switch to using native string methods
+* If nested templating results in unsafe, just error, don't continue
+
+(cherry picked from commit 586f1924512b01305f896d9ae4732773023013a3)
+
+* ci_complete
+
+CVE: CVE-2023-5764
+
+Upstream-Status: Backport [https://github.com/ansible/ansible/commit/723=
9d2d371bc6e274cbb7314e01431adce6ae25a]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ changelogs/fragments/cve-2023-5764.yml        |   6 +
+ lib/ansible/module_utils/common/json.py       |   4 +-
+ lib/ansible/parsing/yaml/dumper.py            |   6 +-
+ lib/ansible/playbook/conditional.py           |   9 +-
+ lib/ansible/playbook/task.py                  |  24 ++
+ lib/ansible/plugins/action/assert.py          |  23 +-
+ lib/ansible/plugins/callback/__init__.py      |   4 +-
+ lib/ansible/plugins/filter/core.py            |   5 +
+ lib/ansible/plugins/lookup/first_found.py     |  15 +-
+ lib/ansible/template/__init__.py              |  15 +-
+ lib/ansible/utils/unsafe_proxy.py             | 265 +++++++++++++++++-
+ .../tasks/scm_dependency_deduplication.yml    |  16 +-
+ .../roles/test_vault_embedded/tasks/main.yml  |   2 +-
+ .../tasks/main.yml                            |   2 +-
+ .../targets/apt_repository/tasks/apt.yml      |  10 +-
+ .../assert/assert.out.nested_tmpl.stderr      |   4 +
+ .../assert/assert.out.nested_tmpl.stdout      |  12 +
+ ...t.quiet.stderr =3D> assert.out.quiet.stderr} |   0
+ ...t.quiet.stdout =3D> assert.out.quiet.stdout} |   0
+ .../targets/assert/nested_tmpl.yml            |   9 +
+ test/integration/targets/assert/quiet.yml     |   4 +-
+ test/integration/targets/assert/runme.sh      |   3 +-
+ .../targets/command_shell/tasks/main.yml      |   2 +-
+ test/integration/targets/copy/tasks/tests.yml |  42 +--
+ test/integration/targets/debug/runme.sh       |   2 +
+ test/integration/targets/debug/unsafe.yml     |  13 +
+ .../targets/dnf/tasks/test_sos_removal.yml    |   2 +-
+ .../integration/targets/expect/tasks/main.yml |   2 +-
+ test/integration/targets/file/tasks/main.yml  |   2 +-
+ .../targets/file/tasks/state_link.yml         |   2 +-
+ test/integration/targets/find/tasks/main.yml  |  12 +-
+ .../gathering_facts/test_gathering_facts.yml  |   4 +-
+ test/integration/targets/git/tasks/depth.yml  |   2 +-
+ .../targets/git/tasks/localmods.yml           |   4 +-
+ .../targets/git/tasks/submodules.yml          |  14 +-
+ .../tests/cli/check_config.yaml               |   4 +-
+ .../tests/cli/deleted.yaml                    |   8 +-
+ .../tests/cli/merged.yaml                     |   8 +-
+ .../tests/cli/overridden.yaml                 |   8 +-
+ .../tests/cli/replaced.yaml                   |   8 +-
+ .../targets/include_vars/tasks/main.yml       |  28 +-
+ .../lookup_ini/test_lookup_properties.yml     |   2 +-
+ .../targets/lookup_subelements/tasks/main.yml |   6 +-
+ .../targets/loop_control/inner.yml            |   4 +-
+ .../modules_test_multiple_roles.yml           |   2 +-
+ ...ules_test_multiple_roles_reverse_order.yml |   2 +-
+ .../multiple_roles/bar/tasks/main.yml         |   2 +-
+ .../multiple_roles/foo/tasks/main.yml         |   2 +-
+ .../integration/targets/script/tasks/main.yml |   4 +-
+ test/integration/targets/slurp/tasks/main.yml |   2 +-
+ .../targets/template/tasks/main.yml           |   2 +-
+ .../unarchive/tasks/test_missing_binaries.yml |   2 +-
+ .../targets/unarchive/tasks/test_mode.yml     |   8 +-
+ .../tasks/test_unprivileged_user.yml          |   2 +-
+ .../targets/unarchive/tasks/test_zip.yml      |   2 +-
+ .../targets/wait_for/tasks/main.yml           |   8 +-
+ test/units/parsing/yaml/test_dumper.py        |   7 +-
+ 57 files changed, 519 insertions(+), 143 deletions(-)
+ create mode 100644 changelogs/fragments/cve-2023-5764.yml
+ create mode 100644 test/integration/targets/assert/assert.out.nested_tm=
pl.stderr
+ create mode 100644 test/integration/targets/assert/assert.out.nested_tm=
pl.stdout
+ rename test/integration/targets/assert/{assert_quiet.out.quiet.stderr =3D=
> assert.out.quiet.stderr} (100%)
+ rename test/integration/targets/assert/{assert_quiet.out.quiet.stdout =3D=
> assert.out.quiet.stdout} (100%)
+ create mode 100644 test/integration/targets/assert/nested_tmpl.yml
+ create mode 100644 test/integration/targets/debug/unsafe.yml
+
+diff --git a/changelogs/fragments/cve-2023-5764.yml b/changelogs/fragmen=
ts/cve-2023-5764.yml
+new file mode 100644
+index 0000000000..c37127dac1
+--- /dev/null
++++ b/changelogs/fragments/cve-2023-5764.yml
+@@ -0,0 +1,6 @@
++security_fixes:
++- templating - Address issues where internal templating can cause unsaf=
e
++  variables to lose their unsafe designation (CVE-2023-5764)
++breaking_changes:
++- assert - Nested templating may result in an inability for the conditi=
onal
++  to be evaluated. See the porting guide for more information.
+diff --git a/lib/ansible/module_utils/common/json.py b/lib/ansible/modul=
e_utils/common/json.py
+index 727083ca23..c4333fc157 100644
+--- a/lib/ansible/module_utils/common/json.py
++++ b/lib/ansible/module_utils/common/json.py
+@@ -30,7 +30,7 @@ def _preprocess_unsafe_encode(value):
+     Used in ``AnsibleJSONEncoder.iterencode``
+     """
+     if _is_unsafe(value):
+-        value =3D {'__ansible_unsafe': to_text(value, errors=3D'surroga=
te_or_strict', nonstring=3D'strict')}
++        value =3D {'__ansible_unsafe': to_text(value._strip_unsafe(), e=
rrors=3D'surrogate_or_strict', nonstring=3D'strict')}
+     elif is_sequence(value):
+         value =3D [_preprocess_unsafe_encode(v) for v in value]
+     elif isinstance(value, Mapping):
+@@ -63,7 +63,7 @@ class AnsibleJSONEncoder(json.JSONEncoder):
+                 value =3D {'__ansible_vault': to_text(o._ciphertext, er=
rors=3D'surrogate_or_strict', nonstring=3D'strict')}
+         elif getattr(o, '__UNSAFE__', False):
+             # unsafe object, this will never be triggered, see ``Ansibl=
eJSONEncoder.iterencode``
+-            value =3D {'__ansible_unsafe': to_text(o, errors=3D'surroga=
te_or_strict', nonstring=3D'strict')}
++            value =3D {'__ansible_unsafe': to_text(o._strip_unsafe(), e=
rrors=3D'surrogate_or_strict', nonstring=3D'strict')}
+         elif isinstance(o, Mapping):
+             # hostvars and other objects
+             value =3D dict(o)
+diff --git a/lib/ansible/parsing/yaml/dumper.py b/lib/ansible/parsing/ya=
ml/dumper.py
+index 8701bb8196..bf2c0843c2 100644
+--- a/lib/ansible/parsing/yaml/dumper.py
++++ b/lib/ansible/parsing/yaml/dumper.py
+@@ -24,7 +24,7 @@ import yaml
+ from ansible.module_utils.six import text_type, binary_type
+ from ansible.module_utils.common.yaml import SafeDumper
+ from ansible.parsing.yaml.objects import AnsibleUnicode, AnsibleSequenc=
e, AnsibleMapping, AnsibleVaultEncryptedUnicode
+-from ansible.utils.unsafe_proxy import AnsibleUnsafeText, AnsibleUnsafe=
Bytes, NativeJinjaUnsafeText, NativeJinjaText
++from ansible.utils.unsafe_proxy import AnsibleUnsafeText, AnsibleUnsafe=
Bytes, NativeJinjaUnsafeText, NativeJinjaText, _is_unsafe
+ from ansible.template import AnsibleUndefined
+ from ansible.vars.hostvars import HostVars, HostVarsVars
+ from ansible.vars.manager import VarsWithSources
+@@ -47,10 +47,14 @@ def represent_vault_encrypted_unicode(self, data):
+
+
+ def represent_unicode(self, data):
++    if _is_unsafe(data):
++        data =3D data._strip_unsafe()
+     return yaml.representer.SafeRepresenter.represent_str(self, text_ty=
pe(data))
+
+
+ def represent_binary(self, data):
++    if _is_unsafe(data):
++        data =3D data._strip_unsafe()
+     return yaml.representer.SafeRepresenter.represent_binary(self, bina=
ry_type(data))
+
+
+diff --git a/lib/ansible/playbook/conditional.py b/lib/ansible/playbook/=
conditional.py
+index fe07358cbd..d994f8f49d 100644
+--- a/lib/ansible/playbook/conditional.py
++++ b/lib/ansible/playbook/conditional.py
+@@ -26,7 +26,7 @@ from jinja2.compiler import generate
+ from jinja2.exceptions import UndefinedError
+
+ from ansible import constants as C
+-from ansible.errors import AnsibleError, AnsibleUndefinedVariable
++from ansible.errors import AnsibleError, AnsibleUndefinedVariable, Ansi=
bleTemplateError
+ from ansible.module_utils.six import text_type
+ from ansible.module_utils._text import to_native, to_text
+ from ansible.playbook.attribute import FieldAttribute
+@@ -138,9 +138,10 @@ class Conditional:
+             if not isinstance(conditional, text_type) or conditional =3D=
=3D "":
+                 return conditional
+
+-            # update the lookups flag, as the string returned above may=
 now be unsafe
+-            # and we don't want future templating calls to do unsafe th=
ings
+-            disable_lookups |=3D hasattr(conditional, '__UNSAFE__')
++            # If the result of the first-pass template render (to resol=
ve inline templates) is marked unsafe,
++            # explicitly fail since the next templating operation would=
 never evaluate
++            if hasattr(conditional, '__UNSAFE__'):
++                raise AnsibleTemplateError('Conditional is marked as un=
safe, and cannot be evaluated.')
+
+             # First, we do some low-level jinja2 parsing involving the =
AST format of the
+             # statement to ensure we don't do anything unsafe (using th=
e disable_lookup flag above)
+diff --git a/lib/ansible/playbook/task.py b/lib/ansible/playbook/task.py
+index ba35fcf0e3..a1a1162bf2 100644
+--- a/lib/ansible/playbook/task.py
++++ b/lib/ansible/playbook/task.py
+@@ -290,6 +290,30 @@ class Task(Base, Conditional, Taggable, CollectionS=
earch):
+
+         super(Task, self).post_validate(templar)
+
++    def _post_validate_args(self, attr, value, templar):
++        # smuggle an untemplated copy of the task args for actions that=
 need more control over the templating of their
++        # input (eg, debug's var/msg, assert's "that" conditional expre=
ssions)
++        self.untemplated_args =3D value
++
++        # now recursively template the args dict
++        args =3D templar.template(value)
++
++        # FIXME: could we just nuke this entirely and/or wrap it up in =
ModuleArgsParser or something?
++        if '_variable_params' in args:
++            variable_params =3D args.pop('_variable_params')
++            if isinstance(variable_params, dict):
++                if C.INJECT_FACTS_AS_VARS:
++                    display.warning("Using a variable for a task's 'arg=
s' is unsafe in some situations "
++                                    "(see https://docs.ansible.com/ansi=
ble/devel/reference_appendices/faq.html#argsplat-unsafe)")
++                variable_params.update(args)
++                args =3D variable_params
++            else:
++                # if we didn't get a dict, it means there's garbage rem=
aining after k=3Dv parsing, just give up
++                # see https://github.com/ansible/ansible/issues/79862
++                raise AnsibleError(f"invalid or malformed argument: '{v=
ariable_params}'")
++
++        return args
++
+     def _post_validate_loop(self, attr, value, templar):
+         '''
+         Override post validation for the loop field, which is templated
+diff --git a/lib/ansible/plugins/action/assert.py b/lib/ansible/plugins/=
action/assert.py
+index 7721a6b47c..e8ab6a9a4f 100644
+--- a/lib/ansible/plugins/action/assert.py
++++ b/lib/ansible/plugins/action/assert.py
+@@ -63,8 +63,29 @@ class ActionModule(ActionBase):
+
+         quiet =3D boolean(self._task.args.get('quiet', False), strict=3D=
False)
+
++        # directly access 'that' via untemplated args from the task so =
we can intelligently trust embedded
++        # templates and preserve the original inputs/locations for bett=
er messaging on assert failures and
++        # errors.
++        # FIXME: even in devel, things like `that: item` don't always w=
ork properly (truthy string value
++        # is not really an embedded expression)
++        # we could fix that by doing direct var lookups on the inputs
++        # FIXME: some form of this code should probably be shared betwe=
en debug, assert, and
++        # Task.post_validate, since they
++        # have a lot of overlapping needs
++        try:
++            thats =3D self._task.untemplated_args['that']
++        except KeyError:
++            # in the case of "we got our entire args dict from a templa=
te", we can just consult the
++            # post-templated dict (the damage has likely already been d=
one for embedded templates anyway)
++            thats =3D self._task.args['that']
++
++        # FIXME: this is a case where we only want to resolve indirecti=
ons, NOT recurse containers
++        # (and even then, the leaf-most expression being wrapped is at =
least suboptimal
++        # (since its expression will be "eaten").
++        if isinstance(thats, str):
++            thats =3D self._templar.template(thats)
++
+         # make sure the 'that' items are a list
+-        thats =3D self._task.args['that']
+         if not isinstance(thats, list):
+             thats =3D [thats]
+
+diff --git a/lib/ansible/plugins/callback/__init__.py b/lib/ansible/plug=
ins/callback/__init__.py
+index d4fc347d03..7646d2939f 100644
+--- a/lib/ansible/plugins/callback/__init__.py
++++ b/lib/ansible/plugins/callback/__init__.py
+@@ -38,7 +38,7 @@ from ansible.parsing.yaml.objects import AnsibleUnicod=
e
+ from ansible.plugins import AnsiblePlugin
+ from ansible.utils.color import stringc
+ from ansible.utils.display import Display
+-from ansible.utils.unsafe_proxy import AnsibleUnsafeText, NativeJinjaUn=
safeText
++from ansible.utils.unsafe_proxy import AnsibleUnsafeText, NativeJinjaUn=
safeText, _is_unsafe
+ from ansible.vars.clean import strip_internal_keys, module_response_dee=
pcopy
+
+ import yaml
+@@ -113,6 +113,8 @@ def _munge_data_for_lossy_yaml(scalar):
+
+ def _pretty_represent_str(self, data):
+     """Uses block style for multi-line strings"""
++    if _is_unsafe(data):
++        data =3D data._strip_unsafe()
+     data =3D text_type(data)
+     if _should_use_block(data):
+         style =3D '|'
+diff --git a/lib/ansible/plugins/filter/core.py b/lib/ansible/plugins/fi=
lter/core.py
+index 52a2cd108e..b7e2c11ec8 100644
+--- a/lib/ansible/plugins/filter/core.py
++++ b/lib/ansible/plugins/filter/core.py
+@@ -37,6 +37,7 @@ from ansible.utils.display import Display
+ from ansible.utils.encrypt import passlib_or_crypt
+ from ansible.utils.hashing import md5s, checksum_s
+ from ansible.utils.unicode import unicode_wrap
++from ansible.utils.unsafe_proxy import _is_unsafe
+ from ansible.utils.vars import merge_hash
+
+ display =3D Display()
+@@ -215,6 +216,8 @@ def from_yaml(data):
+         # The ``text_type`` call here strips any custom
+         # string wrapper class, so that CSafeLoader can
+         # read the data
++        if _is_unsafe(data):
++            data =3D data._strip_unsafe()
+         return yaml_load(text_type(to_text(data, errors=3D'surrogate_or=
_strict')))
+     return data
+
+@@ -224,6 +227,8 @@ def from_yaml_all(data):
+         # The ``text_type`` call here strips any custom
+         # string wrapper class, so that CSafeLoader can
+         # read the data
++        if _is_unsafe(data):
++            data =3D data._strip_unsafe()
+         return yaml_load_all(text_type(to_text(data, errors=3D'surrogat=
e_or_strict')))
+     return data
+
+diff --git a/lib/ansible/plugins/lookup/first_found.py b/lib/ansible/plu=
gins/lookup/first_found.py
+index 5b94b103a4..a882db017b 100644
+--- a/lib/ansible/plugins/lookup/first_found.py
++++ b/lib/ansible/plugins/lookup/first_found.py
+@@ -136,7 +136,6 @@ RETURN =3D """
+     elements: path
+ """
+ import os
+-import re
+
+ from collections.abc import Mapping, Sequence
+
+@@ -147,10 +146,22 @@ from ansible.module_utils.six import string_types
+ from ansible.plugins.lookup import LookupBase
+
+
++def _splitter(value, chars):
++    chars =3D set(chars)
++    v =3D ''
++    for c in value:
++        if c in chars:
++            yield v
++            v =3D ''
++            continue
++        v +=3D c
++    yield v
++
++
+ def _split_on(terms, spliters=3D','):
+     termlist =3D []
+     if isinstance(terms, string_types):
+-        termlist =3D re.split(r'[%s]' % ''.join(map(re.escape, spliters=
)), terms)
++        termlist =3D list(_splitter(terms, spliters))
+     else:
+         # added since options will already listify
+         for t in terms:
+diff --git a/lib/ansible/template/__init__.py b/lib/ansible/template/__i=
nit__.py
+index baa85ed793..c45cfe350e 100644
+--- a/lib/ansible/template/__init__.py
++++ b/lib/ansible/template/__init__.py
+@@ -31,7 +31,7 @@ from contextlib import contextmanager
+ from numbers import Number
+ from traceback import format_exc
+
+-from jinja2.exceptions import TemplateSyntaxError, UndefinedError
++from jinja2.exceptions import TemplateSyntaxError, UndefinedError, Secu=
rityError
+ from jinja2.loaders import FileSystemLoader
+ from jinja2.nativetypes import NativeEnvironment
+ from jinja2.runtime import Context, StrictUndefined
+@@ -55,7 +55,7 @@ from ansible.template.vars import AnsibleJ2Vars
+ from ansible.utils.display import Display
+ from ansible.utils.listify import listify_lookup_plugin_terms
+ from ansible.utils.native_jinja import NativeJinjaText
+-from ansible.utils.unsafe_proxy import wrap_var
++from ansible.utils.unsafe_proxy import wrap_var, AnsibleUnsafeText, Ans=
ibleUnsafeBytes, NativeJinjaUnsafeText
+
+ display =3D Display()
+
+@@ -332,10 +332,21 @@ class AnsibleContext(Context):
+     flag is checked post-templating, and (when set) will result in the
+     final templated result being wrapped in AnsibleUnsafe.
+     '''
++    _disallowed_callables =3D frozenset({
++        AnsibleUnsafeText._strip_unsafe.__qualname__,
++        AnsibleUnsafeBytes._strip_unsafe.__qualname__,
++        NativeJinjaUnsafeText._strip_unsafe.__qualname__,
++    })
++
+     def __init__(self, *args, **kwargs):
+         super(AnsibleContext, self).__init__(*args, **kwargs)
+         self.unsafe =3D False
+
++    def call(self, obj, *args, **kwargs):
++        if getattr(obj, '__qualname__', None) in self._disallowed_calla=
bles or obj in self._disallowed_callables:
++            raise SecurityError(f"{obj!r} is not safely callable")
++        return super().call(obj, *args, **kwargs)
++
+     def _is_unsafe(self, val):
+         '''
+         Our helper function, which will also recursively check dict and
+diff --git a/lib/ansible/utils/unsafe_proxy.py b/lib/ansible/utils/unsaf=
e_proxy.py
+index d78ebf6e8d..7da74dcfb2 100644
+--- a/lib/ansible/utils/unsafe_proxy.py
++++ b/lib/ansible/utils/unsafe_proxy.py
+@@ -69,15 +69,264 @@ class AnsibleUnsafe(object):
+
+
+ class AnsibleUnsafeBytes(binary_type, AnsibleUnsafe):
+-    def decode(self, *args, **kwargs):
+-        """Wrapper method to ensure type conversions maintain unsafe co=
ntext"""
+-        return AnsibleUnsafeText(super(AnsibleUnsafeBytes, self).decode=
(*args, **kwargs))
++    def _strip_unsafe(self):
++        return super().__bytes__()
++
++    def __str__(self, /):  # pylint: disable=3Dinvalid-str-returned
++        return self.encode()
++
++    def __bytes__(self, /):  # pylint: disable=3Dinvalid-bytes-returned
++        return self
++
++    def __repr__(self, /):  # pylint: disable=3Dinvalid-repr-returned
++        return AnsibleUnsafeText(super().__repr__())
++
++    def __format__(self, format_spec, /):  # pylint: disable=3Dinvalid-=
format-returned
++        return self.__class__(super().__format__(format_spec))
++
++    def __getitem__(self, key, /):
++        return self.__class__(super().__getitem__(key))
++
++    def __iter__(self, /):
++        cls =3D self.__class__
++        return (cls(c) for c in super().__iter__())
++
++    def __reversed__(self, /):
++        return self[::-1]
++
++    def __add__(self, value, /):
++        return self.__class__(super().__add__(value))
++
++    def __radd__(self, value, /):
++        return self.__class__(value.__add__(self))
++
++    def __mul__(self, value, /):
++        return self.__class__(super().__mul__(value))
++
++    __rmul__ =3D __mul__
++
++    def __mod__(self, value, /):
++        return self.__class__(super().__mod__(value))
++
++    def __rmod__(self, value, /):
++        return self.__class__(super().__rmod__(value))
++
++    def capitalize(self, /):
++        return self.__class__(super().capitalize())
++
++    def casefold(self, /):
++        return self.__class__(super().casefold())
++
++    def center(self, width, fillchar=3Db' ', /):
++        return self.__class__(super().center(width, fillchar))
++
++    def decode(self, /, encoding=3D'utf-8', errors=3D'strict'):
++        return AnsibleUnsafeText(super().decode(encoding=3Dencoding, er=
rors=3Derrors))
++
++    def removeprefix(self, prefix, /):
++        return self.__class__(super().removeprefix(prefix))
++
++    def removesuffix(self, suffix, /):
++        return self.__class__(super().removesuffix(suffix))
++
++    def expandtabs(self, /, tabsize=3D8):
++        return self.__class__(super().expandtabs(tabsize))
++
++    def format(self, /, *args, **kwargs):
++        return self.__class__(super().format(*args, **kwargs))
++
++    def format_map(self, mapping, /):
++        return self.__class__(super().format_map(mapping))
++
++    def join(self, iterable_of_bytes, /):
++        return self.__class__(super().join(iterable_of_bytes))
++
++    def ljust(self, width, fillchar=3Db' ', /):
++        return self.__class__(super().ljust(width, fillchar))
++
++    def lower(self, /):
++        return self.__class__(super().lower())
++
++    def lstrip(self, bytes=3DNone, /):
++        return self.__class__(super().lstrip(bytes))
++
++    def partition(self, sep, /):
++        cls =3D self.__class__
++        return tuple(cls(e) for e in super().partition(sep))
++
++    def replace(self, old, new, count=3D-1, /):
++        return self.__class__(super().replace(old, new, count))
++
++    def rjust(self, width, fillchar=3Db' ', /):
++        return self.__class__(super().rjust(width, fillchar))
++
++    def rpartition(self, sep, /):
++        cls =3D self.__class__
++        return tuple(cls(e) for e in super().rpartition(sep))
++
++    def rstrip(self, bytes=3DNone, /):
++        return self.__class__(super().rstrip(bytes))
++
++    def split(self, /, sep=3DNone, maxsplit=3D-1):
++        cls =3D self.__class__
++        return [cls(e) for e in super().split(sep=3Dsep, maxsplit=3Dmax=
split)]
++
++    def rsplit(self, /, sep=3DNone, maxsplit=3D-1):
++        cls =3D self.__class__
++        return [cls(e) for e in super().rsplit(sep=3Dsep, maxsplit=3Dma=
xsplit)]
++
++    def splitlines(self, /, keepends=3DFalse):
++        cls =3D self.__class__
++        return [cls(e) for e in super().splitlines(keepends=3Dkeepends)=
]
++
++    def strip(self, bytes=3DNone, /):
++        return self.__class__(super().strip(bytes))
++
++    def swapcase(self, /):
++        return self.__class__(super().swapcase())
++
++    def title(self, /):
++        return self.__class__(super().title())
++
++    def translate(self, table, /, delete=3Db''):
++        return self.__class__(super().translate(table, delete=3Ddelete)=
)
++
++    def upper(self, /):
++        return self.__class__(super().upper())
++
++    def zfill(self, width, /):
++        return self.__class__(super().zfill(width))
+
+
+ class AnsibleUnsafeText(text_type, AnsibleUnsafe):
+-    def encode(self, *args, **kwargs):
+-        """Wrapper method to ensure type conversions maintain unsafe co=
ntext"""
+-        return AnsibleUnsafeBytes(super(AnsibleUnsafeText, self).encode=
(*args, **kwargs))
++    # def __getattribute__(self, name):
++    #     print(f'attr: {name}')
++    #     return object.__getattribute__(self, name)
++
++    def _strip_unsafe(self, /):
++        return super().__str__()
++
++    def __str__(self, /):  # pylint: disable=3Dinvalid-str-returned
++        return self
++
++    def __repr__(self, /):  # pylint: disable=3Dinvalid-repr-returned
++        return self.__class__(super().__repr__())
++
++    def __format__(self, format_spec, /):  # pylint: disable=3Dinvalid-=
format-returned
++        return self.__class__(super().__format__(format_spec))
++
++    def __getitem__(self, key, /):
++        return self.__class__(super().__getitem__(key))
++
++    def __iter__(self, /):
++        cls =3D self.__class__
++        return (cls(c) for c in super().__iter__())
++
++    def __reversed__(self, /):
++        return self[::-1]
++
++    def __add__(self, value, /):
++        return self.__class__(super().__add__(value))
++
++    def __radd__(self, value, /):
++        return self.__class__(value.__add__(self))
++
++    def __mul__(self, value, /):
++        return self.__class__(super().__mul__(value))
++
++    __rmul__ =3D __mul__
++
++    def __mod__(self, value, /):
++        return self.__class__(super().__mod__(value))
++
++    def __rmod__(self, value, /):
++        return self.__class__(super().__rmod__(value))
++
++    def capitalize(self, /):
++        return self.__class__(super().capitalize())
++
++    def casefold(self, /):
++        return self.__class__(super().casefold())
++
++    def center(self, width, fillchar=3D' ', /):
++        return self.__class__(super().center(width, fillchar))
++
++    def encode(self, /, encoding=3D'utf-8', errors=3D'strict'):
++        return AnsibleUnsafeBytes(super().encode(encoding=3Dencoding, e=
rrors=3Derrors))
++
++    def removeprefix(self, prefix, /):
++        return self.__class__(super().removeprefix(prefix))
++
++    def removesuffix(self, suffix, /):
++        return self.__class__(super().removesuffix(suffix))
++
++    def expandtabs(self, /, tabsize=3D8):
++        return self.__class__(super().expandtabs(tabsize))
++
++    def format(self, /, *args, **kwargs):
++        return self.__class__(super().format(*args, **kwargs))
++
++    def format_map(self, mapping, /):
++        return self.__class__(super().format_map(mapping))
++
++    def join(self, iterable, /):
++        return self.__class__(super().join(iterable))
++
++    def ljust(self, width, fillchar=3D' ', /):
++        return self.__class__(super().ljust(width, fillchar))
++
++    def lower(self, /):
++        return self.__class__(super().lower())
++
++    def lstrip(self, chars=3DNone, /):
++        return self.__class__(super().lstrip(chars))
++
++    def partition(self, sep, /):
++        cls =3D self.__class__
++        return tuple(cls(e) for e in super().partition(sep))
++
++    def replace(self, old, new, count=3D-1, /):
++        return self.__class__(super().replace(old, new, count))
++
++    def rjust(self, width, fillchar=3D' ', /):
++        return self.__class__(super().rjust(width, fillchar))
++
++    def rpartition(self, sep, /):
++        cls =3D self.__class__
++        return tuple(cls(e) for e in super().rpartition(sep))
++
++    def rstrip(self, chars=3DNone, /):
++        return self.__class__(super().rstrip(chars))
++
++    def split(self, /, sep=3DNone, maxsplit=3D-1):
++        cls =3D self.__class__
++        return [cls(e) for e in super().split(sep=3Dsep, maxsplit=3Dmax=
split)]
++
++    def rsplit(self, /, sep=3DNone, maxsplit=3D-1):
++        cls =3D self.__class__
++        return [cls(e) for e in super().rsplit(sep=3Dsep, maxsplit=3Dma=
xsplit)]
++
++    def splitlines(self, /, keepends=3DFalse):
++        cls =3D self.__class__
++        return [cls(e) for e in super().splitlines(keepends=3Dkeepends)=
]
++
++    def strip(self, chars=3DNone, /):
++        return self.__class__(super().strip(chars))
++
++    def swapcase(self, /):
++        return self.__class__(super().swapcase())
++
++    def title(self, /):
++        return self.__class__(super().title())
++
++    def translate(self, table, /):
++        return self.__class__(super().translate(table))
++
++    def upper(self, /):
++        return self.__class__(super().upper())
++
++    def zfill(self, width, /):
++        return self.__class__(super().zfill(width))
+
+
+ class NativeJinjaUnsafeText(NativeJinjaText, AnsibleUnsafeText):
+@@ -126,3 +375,7 @@ def to_unsafe_bytes(*args, **kwargs):
+
+ def to_unsafe_text(*args, **kwargs):
+     return wrap_var(to_text(*args, **kwargs))
++
++
++def _is_unsafe(obj):
++    return getattr(obj, '__UNSAFE__', False) is True
+diff --git a/test/integration/targets/ansible-galaxy-collection-scm/task=
s/scm_dependency_deduplication.yml b/test/integration/targets/ansible-gal=
axy-collection-scm/tasks/scm_dependency_deduplication.yml
+index f200be1803..e084752494 100644
+--- a/test/integration/targets/ansible-galaxy-collection-scm/tasks/scm_d=
ependency_deduplication.yml
++++ b/test/integration/targets/ansible-galaxy-collection-scm/tasks/scm_d=
ependency_deduplication.yml
+@@ -13,22 +13,22 @@
+         in command.stdout_lines
+       - >-
+         "Installing 'namespace_1.collection_1:1.0.0' to
+-        '{{ install_path }}/namespace_1/collection_1'"
++        '" ~ install_path ~ "/namespace_1/collection_1'"
+         in command.stdout_lines
+       - >-
+         'Created collection for namespace_1.collection_1:1.0.0 at
+-        {{ install_path }}/namespace_1/collection_1'
++        ' ~ install_path ~ '/namespace_1/collection_1'
+         in command.stdout_lines
+       - >-
+         'namespace_1.collection_1:1.0.0 was installed successfully'
+         in command.stdout_lines
+       - >-
+         "Installing 'namespace_2.collection_2:1.0.0' to
+-        '{{ install_path }}/namespace_2/collection_2'"
++        '" ~ install_path ~ "/namespace_2/collection_2'"
+         in command.stdout_lines
+       - >-
+         'Created collection for namespace_2.collection_2:1.0.0 at
+-        {{ install_path }}/namespace_2/collection_2'
++        ' ~ install_path ~ '/namespace_2/collection_2'
+         in command.stdout_lines
+       - >-
+         'namespace_2.collection_2:1.0.0 was installed successfully'
+@@ -58,22 +58,22 @@
+         in command.stdout_lines
+       - >-
+         "Installing 'namespace_1.collection_1:1.0.0' to
+-        '{{ install_path }}/namespace_1/collection_1'"
++        '" ~ install_path ~ "/namespace_1/collection_1'"
+         in command.stdout_lines
+       - >-
+         'Created collection for namespace_1.collection_1:1.0.0 at
+-        {{ install_path }}/namespace_1/collection_1'
++        ' ~ install_path ~ '/namespace_1/collection_1'
+         in command.stdout_lines
+       - >-
+         'namespace_1.collection_1:1.0.0 was installed successfully'
+         in command.stdout_lines
+       - >-
+         "Installing 'namespace_2.collection_2:1.0.0' to
+-        '{{ install_path }}/namespace_2/collection_2'"
++        '" ~ install_path ~ "/namespace_2/collection_2'"
+         in command.stdout_lines
+       - >-
+         'Created collection for namespace_2.collection_2:1.0.0 at
+-        {{ install_path }}/namespace_2/collection_2'
++        ' ~ install_path ~ '/namespace_2/collection_2'
+         in command.stdout_lines
+       - >-
+         'namespace_2.collection_2:1.0.0 was installed successfully'
+diff --git a/test/integration/targets/ansible-vault/roles/test_vault_emb=
edded/tasks/main.yml b/test/integration/targets/ansible-vault/roles/test_=
vault_embedded/tasks/main.yml
+index eba938966d..98ef751b86 100644
+--- a/test/integration/targets/ansible-vault/roles/test_vault_embedded/t=
asks/main.yml
++++ b/test/integration/targets/ansible-vault/roles/test_vault_embedded/t=
asks/main.yml
+@@ -2,7 +2,7 @@
+ - name: Assert that a embedded vault of a string with no newline works
+   assert:
+     that:
+-      - '"{{ vault_encrypted_one_line_var }}" =3D=3D "Setec Astronomy"'
++      - 'vault_encrypted_one_line_var =3D=3D "Setec Astronomy"'
+
+ - name: Assert that a multi line embedded vault works, including new li=
ne
+   assert:
+diff --git a/test/integration/targets/ansible-vault/roles/test_vault_fil=
e_encrypted_embedded/tasks/main.yml b/test/integration/targets/ansible-va=
ult/roles/test_vault_file_encrypted_embedded/tasks/main.yml
+index e09004a1d9..107e65cb11 100644
+--- a/test/integration/targets/ansible-vault/roles/test_vault_file_encry=
pted_embedded/tasks/main.yml
++++ b/test/integration/targets/ansible-vault/roles/test_vault_file_encry=
pted_embedded/tasks/main.yml
+@@ -2,7 +2,7 @@
+ - name: Assert that a vault encrypted file with embedded vault of a str=
ing with no newline works
+   assert:
+     that:
+-      - '"{{ vault_file_encrypted_with_encrypted_one_line_var }}" =3D=3D=
 "Setec Astronomy"'
++      - 'vault_file_encrypted_with_encrypted_one_line_var =3D=3D "Setec=
 Astronomy"'
+
+ - name: Assert that a vault encrypted file with multi line embedded vau=
lt works, including new line
+   assert:
+diff --git a/test/integration/targets/apt_repository/tasks/apt.yml b/tes=
t/integration/targets/apt_repository/tasks/apt.yml
+index 0dc25afd59..9c15e64765 100644
+--- a/test/integration/targets/apt_repository/tasks/apt.yml
++++ b/test/integration/targets/apt_repository/tasks/apt.yml
+@@ -50,7 +50,7 @@
+     that:
+       - 'result.changed'
+       - 'result.state =3D=3D "present"'
+-      - 'result.repo =3D=3D "{{test_ppa_name}}"'
++      - 'result.repo =3D=3D test_ppa_name'
+
+ - name: 'examine apt cache mtime'
+   stat: path=3D'/var/cache/apt/pkgcache.bin'
+@@ -81,7 +81,7 @@
+     that:
+       - 'result.changed'
+       - 'result.state =3D=3D "present"'
+-      - 'result.repo =3D=3D "{{test_ppa_name}}"'
++      - 'result.repo =3D=3D test_ppa_name'
+
+ - name: 'examine apt cache mtime'
+   stat: path=3D'/var/cache/apt/pkgcache.bin'
+@@ -112,7 +112,7 @@
+     that:
+       - 'result.changed'
+       - 'result.state =3D=3D "present"'
+-      - 'result.repo =3D=3D "{{test_ppa_name}}"'
++      - 'result.repo =3D=3D test_ppa_name'
+
+ - name: 'examine apt cache mtime'
+   stat: path=3D'/var/cache/apt/pkgcache.bin'
+@@ -151,7 +151,7 @@
+     that:
+       - 'result.changed'
+       - 'result.state =3D=3D "present"'
+-      - 'result.repo =3D=3D "{{test_ppa_spec}}"'
++      - 'result.repo =3D=3D test_ppa_spec'
+       - result_cache is not changed
+
+ - name: 'examine apt cache mtime'
+@@ -191,7 +191,7 @@
+     that:
+       - 'result.changed'
+       - 'result.state =3D=3D "present"'
+-      - 'result.repo =3D=3D "{{test_ppa_spec}}"'
++      - 'result.repo =3D=3D test_ppa_spec'
+
+ - name: 'examine source file'
+   stat: path=3D'/etc/apt/sources.list.d/{{test_ppa_filename}}.list'
+diff --git a/test/integration/targets/assert/assert.out.nested_tmpl.stde=
rr b/test/integration/targets/assert/assert.out.nested_tmpl.stderr
+new file mode 100644
+index 0000000000..ea208a41c7
+--- /dev/null
++++ b/test/integration/targets/assert/assert.out.nested_tmpl.stderr
+@@ -0,0 +1,4 @@
+++ ansible-playbook -i localhost, -c local nested_tmpl.yml
++++ set +x
++[WARNING]: conditional statements should not include jinja2 templating
++delimiters such as {{ }} or {% %}. Found: "{{ foo }}" =3D=3D "bar"
+diff --git a/test/integration/targets/assert/assert.out.nested_tmpl.stdo=
ut b/test/integration/targets/assert/assert.out.nested_tmpl.stdout
+new file mode 100644
+index 0000000000..8ca3fb76d4
+--- /dev/null
++++ b/test/integration/targets/assert/assert.out.nested_tmpl.stdout
+@@ -0,0 +1,12 @@
++
++PLAY [localhost] ******************************************************=
*********
++
++TASK [assert] *********************************************************=
*********
++ok: [localhost] =3D> {
++    "changed": false,
++    "msg": "All assertions passed"
++}
++
++PLAY RECAP ************************************************************=
*********
++localhost                  : ok=3D1    changed=3D0    unreachable=3D0  =
  failed=3D0    skipped=3D0    rescued=3D0    ignored=3D0
++
+diff --git a/test/integration/targets/assert/assert_quiet.out.quiet.stde=
rr b/test/integration/targets/assert/assert.out.quiet.stderr
+similarity index 100%
+rename from test/integration/targets/assert/assert_quiet.out.quiet.stder=
r
+rename to test/integration/targets/assert/assert.out.quiet.stderr
+diff --git a/test/integration/targets/assert/assert_quiet.out.quiet.stdo=
ut b/test/integration/targets/assert/assert.out.quiet.stdout
+similarity index 100%
+rename from test/integration/targets/assert/assert_quiet.out.quiet.stdou=
t
+rename to test/integration/targets/assert/assert.out.quiet.stdout
+diff --git a/test/integration/targets/assert/nested_tmpl.yml b/test/inte=
gration/targets/assert/nested_tmpl.yml
+new file mode 100644
+index 0000000000..3da4b1d80e
+--- /dev/null
++++ b/test/integration/targets/assert/nested_tmpl.yml
+@@ -0,0 +1,9 @@
++- hosts: localhost
++  gather_facts: False
++  tasks:
++    - assert:
++        that:
++          - '"{{ foo }}" =3D=3D "bar"'
++          - foo =3D=3D "bar"
++      vars:
++        foo: bar
+diff --git a/test/integration/targets/assert/quiet.yml b/test/integratio=
n/targets/assert/quiet.yml
+index 6834712c2c..1c425cb5ba 100644
+--- a/test/integration/targets/assert/quiet.yml
++++ b/test/integration/targets/assert/quiet.yml
+@@ -5,12 +5,12 @@
+     item_A: yes
+   tasks:
+   - assert:
+-      that: "{{ item }} is defined"
++      that: "item is defined"
+       quiet: True
+     with_items:
+       - item_A
+   - assert:
+-      that: "{{ item }} is defined"
++      that: "item is defined"
+       quiet: False
+     with_items:
+       - item_A
+diff --git a/test/integration/targets/assert/runme.sh b/test/integration=
/targets/assert/runme.sh
+index ca0a858726..b79072813d 100755
+--- a/test/integration/targets/assert/runme.sh
++++ b/test/integration/targets/assert/runme.sh
+@@ -45,7 +45,7 @@ cleanup() {
+    fi
+ }
+
+-BASEFILE=3Dassert_quiet.out
++BASEFILE=3Dassert.out
+
+ ORIGFILE=3D"${BASEFILE}"
+ OUTFILE=3D"${BASEFILE}.new"
+@@ -69,3 +69,4 @@ export ANSIBLE_NOCOLOR=3D1
+ export ANSIBLE_RETRY_FILES_ENABLED=3D0
+
+ run_test quiet
++run_test nested_tmpl
+diff --git a/test/integration/targets/command_shell/tasks/main.yml b/tes=
t/integration/targets/command_shell/tasks/main.yml
+index 12a944c48c..1f4aa5d75e 100644
+--- a/test/integration/targets/command_shell/tasks/main.yml
++++ b/test/integration/targets/command_shell/tasks/main.yml
+@@ -296,7 +296,7 @@
+   assert:
+     that:
+     - shell_result0 is changed
+-    - shell_result0.cmd =3D=3D '{{ remote_tmp_dir_test }}/test.sh'
++    - shell_result0.cmd =3D=3D remote_tmp_dir_test ~ '/test.sh'
+     - shell_result0.rc =3D=3D 0
+     - shell_result0.stderr =3D=3D ''
+     - shell_result0.stdout =3D=3D 'win'
+diff --git a/test/integration/targets/copy/tasks/tests.yml b/test/integr=
ation/targets/copy/tasks/tests.yml
+index 7220356332..d6c8e63c9a 100644
+--- a/test/integration/targets/copy/tasks/tests.yml
++++ b/test/integration/targets/copy/tasks/tests.yml
+@@ -1176,7 +1176,7 @@
+   assert:
+     that:
+       - "copy_result6.changed"
+-      - "copy_result6.dest =3D=3D '{{remote_dir_expanded}}/multiline.tx=
t'"
++      - "copy_result6.dest =3D=3D remote_dir_expanded ~ '/multiline.txt=
'"
+       - "copy_result6.checksum =3D=3D '9cd0697c6a9ff6689f0afb9136fa62e0=
b3fee903'"
+
+ # test overwriting a file as an unprivileged user (pull request #8624)
+@@ -2079,26 +2079,26 @@
+     assert:
+       that:
+       - testcase5 is changed
+-      - "stat_new_dir_with_chown.stat.uid =3D=3D {{ ansible_copy_test_u=
ser.uid }}"
+-      - "stat_new_dir_with_chown.stat.gid =3D=3D {{ ansible_copy_test_g=
roup.gid }}"
+-      - "stat_new_dir_with_chown.stat.pw_name =3D=3D '{{ ansible_copy_t=
est_user_name }}'"
+-      - "stat_new_dir_with_chown.stat.gr_name =3D=3D '{{ ansible_copy_t=
est_user_name }}'"
+-      - "stat_new_dir_with_chown_file1.stat.uid =3D=3D {{ ansible_copy_=
test_user.uid }}"
+-      - "stat_new_dir_with_chown_file1.stat.gid =3D=3D {{ ansible_copy_=
test_group.gid }}"
+-      - "stat_new_dir_with_chown_file1.stat.pw_name =3D=3D '{{ ansible_=
copy_test_user_name }}'"
+-      - "stat_new_dir_with_chown_file1.stat.gr_name =3D=3D '{{ ansible_=
copy_test_user_name }}'"
+-      - "stat_new_dir_with_chown_subdir.stat.uid =3D=3D {{ ansible_copy=
_test_user.uid }}"
+-      - "stat_new_dir_with_chown_subdir.stat.gid =3D=3D {{ ansible_copy=
_test_group.gid }}"
+-      - "stat_new_dir_with_chown_subdir.stat.pw_name =3D=3D '{{ ansible=
_copy_test_user_name }}'"
+-      - "stat_new_dir_with_chown_subdir.stat.gr_name =3D=3D '{{ ansible=
_copy_test_user_name }}'"
+-      - "stat_new_dir_with_chown_subdir_file12.stat.uid =3D=3D {{ ansib=
le_copy_test_user.uid }}"
+-      - "stat_new_dir_with_chown_subdir_file12.stat.gid =3D=3D {{ ansib=
le_copy_test_group.gid }}"
+-      - "stat_new_dir_with_chown_subdir_file12.stat.pw_name =3D=3D '{{ =
ansible_copy_test_user_name }}'"
+-      - "stat_new_dir_with_chown_subdir_file12.stat.gr_name =3D=3D '{{ =
ansible_copy_test_user_name }}'"
+-      - "stat_new_dir_with_chown_link_file12.stat.uid =3D=3D {{ ansible=
_copy_test_user.uid }}"
+-      - "stat_new_dir_with_chown_link_file12.stat.gid =3D=3D {{ ansible=
_copy_test_group.gid }}"
+-      - "stat_new_dir_with_chown_link_file12.stat.pw_name =3D=3D '{{ an=
sible_copy_test_user_name }}'"
+-      - "stat_new_dir_with_chown_link_file12.stat.gr_name =3D=3D '{{ an=
sible_copy_test_user_name }}'"
++      - "stat_new_dir_with_chown.stat.uid =3D=3D ansible_copy_test_user=
.uid"
++      - "stat_new_dir_with_chown.stat.gid =3D=3D ansible_copy_test_grou=
p.gid"
++      - "stat_new_dir_with_chown.stat.pw_name =3D=3D ansible_copy_test_=
user_name"
++      - "stat_new_dir_with_chown.stat.gr_name =3D=3D ansible_copy_test_=
user_name"
++      - "stat_new_dir_with_chown_file1.stat.uid =3D=3D ansible_copy_tes=
t_user.uid"
++      - "stat_new_dir_with_chown_file1.stat.gid =3D=3D ansible_copy_tes=
t_group.gid"
++      - "stat_new_dir_with_chown_file1.stat.pw_name =3D=3D ansible_copy=
_test_user_name"
++      - "stat_new_dir_with_chown_file1.stat.gr_name =3D=3D ansible_copy=
_test_user_name"
++      - "stat_new_dir_with_chown_subdir.stat.uid =3D=3D ansible_copy_te=
st_user.uid"
++      - "stat_new_dir_with_chown_subdir.stat.gid =3D=3D ansible_copy_te=
st_group.gid"
++      - "stat_new_dir_with_chown_subdir.stat.pw_name =3D=3D ansible_cop=
y_test_user_name"
++      - "stat_new_dir_with_chown_subdir.stat.gr_name =3D=3D ansible_cop=
y_test_user_name"
++      - "stat_new_dir_with_chown_subdir_file12.stat.uid =3D=3D ansible_=
copy_test_user.uid"
++      - "stat_new_dir_with_chown_subdir_file12.stat.gid =3D=3D ansible_=
copy_test_group.gid"
++      - "stat_new_dir_with_chown_subdir_file12.stat.pw_name =3D=3D ansi=
ble_copy_test_user_name"
++      - "stat_new_dir_with_chown_subdir_file12.stat.gr_name =3D=3D ansi=
ble_copy_test_user_name"
++      - "stat_new_dir_with_chown_link_file12.stat.uid =3D=3D ansible_co=
py_test_user.uid"
++      - "stat_new_dir_with_chown_link_file12.stat.gid =3D=3D ansible_co=
py_test_group.gid"
++      - "stat_new_dir_with_chown_link_file12.stat.pw_name =3D=3D ansibl=
e_copy_test_user_name"
++      - "stat_new_dir_with_chown_link_file12.stat.gr_name =3D=3D ansibl=
e_copy_test_user_name"
+
+   always:
+     - name: execute - remove the user for test
+diff --git a/test/integration/targets/debug/runme.sh b/test/integration/=
targets/debug/runme.sh
+index 5faeb782a6..dc02859d35 100755
+--- a/test/integration/targets/debug/runme.sh
++++ b/test/integration/targets/debug/runme.sh
+@@ -18,3 +18,5 @@ done
+
+ # ensure debug does not set top level vars when looking at ansible_fact=
s
+ ansible-playbook nosetfacts.yml "$@"
++
++ansible-playbook unsafe.yml "$@"
+diff --git a/test/integration/targets/debug/unsafe.yml b/test/integratio=
n/targets/debug/unsafe.yml
+new file mode 100644
+index 0000000000..6a78af1a69
+--- /dev/null
++++ b/test/integration/targets/debug/unsafe.yml
+@@ -0,0 +1,13 @@
++- hosts: localhost
++  gather_facts: false
++  vars:
++    unsafe_var: !unsafe undef()|mandatory
++  tasks:
++    - debug:
++        var: '{{ unsafe_var }}'
++      ignore_errors: true
++      register: result
++
++    - assert:
++        that:
++          - result is successful
+diff --git a/test/integration/targets/dnf/tasks/test_sos_removal.yml b/t=
est/integration/targets/dnf/tasks/test_sos_removal.yml
+index 40ceb62bf4..0d70cf7877 100644
+--- a/test/integration/targets/dnf/tasks/test_sos_removal.yml
++++ b/test/integration/targets/dnf/tasks/test_sos_removal.yml
+@@ -15,5 +15,5 @@
+     that:
+       - sos_rm is successful
+       - sos_rm is changed
+-      - "'Removed: sos-{{ sos_version }}-{{ sos_release }}' in sos_rm.r=
esults[0]"
++      - "'Removed: sos-' ~ sos_version ~ '-' ~ sos_release in sos_rm.re=
sults[0]"
+       - sos_rm.results|length =3D=3D 1
+diff --git a/test/integration/targets/expect/tasks/main.yml b/test/integ=
ration/targets/expect/tasks/main.yml
+index d6f43f2c6a..7bf18c5e5c 100644
+--- a/test/integration/targets/expect/tasks/main.yml
++++ b/test/integration/targets/expect/tasks/main.yml
+@@ -117,7 +117,7 @@
+ - name: assert chdir works
+   assert:
+     that:
+-    - "'{{chdir_result.stdout | trim}}' =3D=3D '{{remote_tmp_dir_real_p=
ath.stdout | trim}}'"
++    - "chdir_result.stdout | trim =3D=3D remote_tmp_dir_real_path.stdou=
t | trim"
+
+ - name: test timeout option
+   expect:
+diff --git a/test/integration/targets/file/tasks/main.yml b/test/integra=
tion/targets/file/tasks/main.yml
+index 17b0fae68a..a5bd68d768 100644
+--- a/test/integration/targets/file/tasks/main.yml
++++ b/test/integration/targets/file/tasks/main.yml
+@@ -927,7 +927,7 @@
+     that:
+       - "file_error3 is failed"
+       - "file_error3.msg =3D=3D 'src does not exist'"
+-      - "file_error3.dest =3D=3D '{{ remote_tmp_dir_test }}/hard.txt' |=
 expanduser"
++      - "file_error3.dest =3D=3D remote_tmp_dir_test | expanduser ~ '/h=
ard.txt'"
+       - "file_error3.src =3D=3D 'non-existing-file-that-does-not-exist.=
txt'"
+
+ - block:
+diff --git a/test/integration/targets/file/tasks/state_link.yml b/test/i=
ntegration/targets/file/tasks/state_link.yml
+index 673fe6fd52..6f96cdcba9 100644
+--- a/test/integration/targets/file/tasks/state_link.yml
++++ b/test/integration/targets/file/tasks/state_link.yml
+@@ -199,7 +199,7 @@
+       - "missing_dst_no_follow_enable_force_use_mode2 is changed"
+       - "missing_dst_no_follow_enable_force_use_mode3 is not changed"
+       - "soft3_result['stat'].islnk"
+-      - "soft3_result['stat'].lnk_target =3D=3D '{{ user.home=C2=A0}}/n=
onexistent'"
++      - "soft3_result['stat'].lnk_target =3D=3D user.home=C2=A0~ '/none=
xistent'"
+
+ #
+ # Test creating a link to a directory https://github.com/ansible/ansibl=
e/issues/1369
+diff --git a/test/integration/targets/find/tasks/main.yml b/test/integra=
tion/targets/find/tasks/main.yml
+index 5381a14478..89c62b9b6f 100644
+--- a/test/integration/targets/find/tasks/main.yml
++++ b/test/integration/targets/find/tasks/main.yml
+@@ -267,7 +267,7 @@
+ - name: assert we skipped the ogg file
+   assert:
+     that:
+-      - '"{{ remote_tmp_dir_test }}/e/f/g/h/8.ogg" not in find_test3_li=
st'
++      - 'remote_tmp_dir_test ~ "/e/f/g/h/8.ogg" not in find_test3_list'
+
+ - name: patterns with regex
+   find:
+@@ -317,7 +317,7 @@
+   assert:
+     that:
+       - result.matched =3D=3D 1
+-      - '"{{ remote_tmp_dir_test }}/astest/old.txt" in astest_list'
++      - 'remote_tmp_dir_test ~ "/astest/old.txt" in astest_list'
+
+ - name: find files newer than 1 week
+   find:
+@@ -332,7 +332,7 @@
+   assert:
+     that:
+       - result.matched =3D=3D 1
+-      - '"{{ remote_tmp_dir_test }}/astest/new.txt" in astest_list'
++      - 'remote_tmp_dir_test ~ "/astest/new.txt" in astest_list'
+
+ - name: add some content to the new file
+   shell: "echo hello world > {{ remote_tmp_dir_test }}/astest/new.txt"
+@@ -352,7 +352,7 @@
+   assert:
+     that:
+       - result.matched =3D=3D 1
+-      - '"{{ remote_tmp_dir_test }}/astest/new.txt" in astest_list'
++      - 'remote_tmp_dir_test ~ "/astest/new.txt" in astest_list'
+       - '"checksum" in result.files[0]'
+
+ - name: find ANY item with LESS than 5 bytes, also get checksums
+@@ -371,6 +371,6 @@
+   assert:
+     that:
+       - result.matched =3D=3D 2
+-      - '"{{ remote_tmp_dir_test }}/astest/old.txt" in astest_list'
+-      - '"{{ remote_tmp_dir_test }}/astest/.hidden.txt" in astest_list'
++      - 'remote_tmp_dir_test ~ "/astest/old.txt" in astest_list'
++      - 'remote_tmp_dir_test ~ "/astest/.hidden.txt" in astest_list'
+       - '"checksum" in result.files[0]'
+diff --git a/test/integration/targets/gathering_facts/test_gathering_fac=
ts.yml b/test/integration/targets/gathering_facts/test_gathering_facts.ym=
l
+index 47027e8717..faa187b73e 100644
+--- a/test/integration/targets/gathering_facts/test_gathering_facts.yml
++++ b/test/integration/targets/gathering_facts/test_gathering_facts.yml
+@@ -433,7 +433,7 @@
+     - name: Test reading facts from default fact_path
+       assert:
+         that:
+-          - '"{{ ansible_local.testfact.fact_dir }}" =3D=3D "default"'
++          - 'ansible_local.testfact.fact_dir =3D=3D "default"'
+
+ - hosts: facthost9
+   tags: [ 'fact_local']
+@@ -444,7 +444,7 @@
+     - name: Test reading facts from custom fact_path
+       assert:
+         that:
+-          - '"{{ ansible_local.testfact.fact_dir }}" =3D=3D "custom"'
++          - 'ansible_local.testfact.fact_dir =3D=3D "custom"'
+
+ - hosts: facthost20
+   tags: [ 'fact_facter_ohai' ]
+diff --git a/test/integration/targets/git/tasks/depth.yml b/test/integra=
tion/targets/git/tasks/depth.yml
+index 547f84f7b5..e0585ca39b 100644
+--- a/test/integration/targets/git/tasks/depth.yml
++++ b/test/integration/targets/git/tasks/depth.yml
+@@ -169,7 +169,7 @@
+ - name: DEPTH | check update arrived
+   assert:
+     that:
+-      - "{{ a_file.content | b64decode | trim }} =3D=3D 3"
++      - a_file.content | b64decode | trim =3D=3D "3"
+       - git_fetch is changed
+
+ - name: DEPTH | clear checkout_dir
+diff --git a/test/integration/targets/git/tasks/localmods.yml b/test/int=
egration/targets/git/tasks/localmods.yml
+index 09a1326d58..0e0cf684ed 100644
+--- a/test/integration/targets/git/tasks/localmods.yml
++++ b/test/integration/targets/git/tasks/localmods.yml
+@@ -47,7 +47,7 @@
+ - name: LOCALMODS | check update arrived
+   assert:
+     that:
+-      - "{{ a_file.content | b64decode | trim }} =3D=3D 2"
++      - a_file.content | b64decode | trim =3D=3D "2"
+       - git_fetch_force is changed
+
+ - name: LOCALMODS | clear checkout_dir
+@@ -105,7 +105,7 @@
+ - name: LOCALMODS | check update arrived
+   assert:
+     that:
+-      - "{{ a_file.content | b64decode | trim }} =3D=3D 2"
++      - a_file.content | b64decode | trim =3D=3D "2"
+       - git_fetch_force is changed
+
+ - name: LOCALMODS | clear checkout_dir
+diff --git a/test/integration/targets/git/tasks/submodules.yml b/test/in=
tegration/targets/git/tasks/submodules.yml
+index 0b311e7984..b6b02490b4 100644
+--- a/test/integration/targets/git/tasks/submodules.yml
++++ b/test/integration/targets/git/tasks/submodules.yml
+@@ -32,7 +32,7 @@
+
+ - name: SUBMODULES | Ensure submodu1 is at the appropriate commit
+   assert:
+-    that: '{{ submodule1.stdout_lines | length }} =3D=3D 2'
++    that: 'submodule1.stdout_lines | length =3D=3D 2'
+
+ - name: SUBMODULES | clear checkout_dir
+   file:
+@@ -53,7 +53,7 @@
+
+ - name: SUBMODULES | Ensure submodule1 is at the appropriate commit
+   assert:
+-    that: '{{ submodule1.stdout_lines | length }} =3D=3D 4'
++    that: 'submodule1.stdout_lines | length =3D=3D 4'
+
+ - name: SUBMODULES | Copy the checkout so we can run several different =
tests on it
+   command: 'cp -pr {{ checkout_dir }} {{ checkout_dir }}.bak'
+@@ -84,8 +84,8 @@
+ - name: SUBMODULES | Ensure both submodules are at the appropriate comm=
it
+   assert:
+     that:
+-      - '{{ submodule1.stdout_lines|length }} =3D=3D 4'
+-      - '{{ submodule2.stdout_lines|length }} =3D=3D 2'
++      - 'submodule1.stdout_lines|length =3D=3D 4'
++      - 'submodule2.stdout_lines|length =3D=3D 2'
+
+
+ - name: SUBMODULES | Remove checkout dir
+@@ -112,7 +112,7 @@
+
+ - name: SUBMODULES | Ensure submodule1 is at the appropriate commit
+   assert:
+-    that: '{{ submodule1.stdout_lines | length }} =3D=3D 5'
++    that: 'submodule1.stdout_lines | length =3D=3D 5'
+
+
+ - name: SUBMODULES | Test that update with recursive found new submodul=
es
+@@ -121,7 +121,7 @@
+
+ - name: SUBMODULES | Enusre submodule2 is at the appropriate commit
+   assert:
+-    that: '{{ submodule2.stdout_lines | length }} =3D=3D 4'
++    that: 'submodule2.stdout_lines | length =3D=3D 4'
+
+ - name: SUBMODULES | clear checkout_dir
+   file:
+@@ -147,4 +147,4 @@
+
+ - name: SUBMODULES | Ensure submodule1 is at the appropriate commit
+   assert:
+-    that: '{{ submodule1.stdout_lines | length }} =3D=3D 4'
++    that: 'submodule1.stdout_lines | length =3D=3D 4'
+diff --git a/test/integration/targets/incidental_vyos_config/tests/cli/c=
heck_config.yaml b/test/integration/targets/incidental_vyos_config/tests/=
cli/check_config.yaml
+index f1ddc71b2c..e45331a148 100644
+--- a/test/integration/targets/incidental_vyos_config/tests/cli/check_co=
nfig.yaml
++++ b/test/integration/targets/incidental_vyos_config/tests/cli/check_co=
nfig.yaml
+@@ -22,7 +22,7 @@
+ - name: Check that multiple duplicate lines collapse into a single comm=
ands
+   assert:
+     that:
+-      - "{{ result.commands|length }} =3D=3D 1"
++      - "result.commands|length =3D=3D 1"
+
+ - name: Check that set is correctly prepended
+   assert:
+@@ -58,6 +58,6 @@
+
+ - assert:
+     that:
+-      - "{{ result.filtered|length }} =3D=3D 2"
++      - "result.filtered|length =3D=3D 2"
+
+ - debug: msg=3D"END cli/config_check.yaml on connection=3D{{ ansible_co=
nnection }}"
+diff --git a/test/integration/targets/incidental_vyos_lldp_interfaces/te=
sts/cli/deleted.yaml b/test/integration/targets/incidental_vyos_lldp_inte=
rfaces/tests/cli/deleted.yaml
+index 7b2d53a340..316e91c43d 100644
+--- a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli=
/deleted.yaml
++++ b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli=
/deleted.yaml
+@@ -16,17 +16,17 @@
+     - name: Assert that the before dicts were correctly generated
+       assert:
+         that:
+-          - "{{ populate | symmetric_difference(result['before']) |leng=
th =3D=3D 0 }}"
++          - "populate | symmetric_difference(result['before']) |length =
=3D=3D 0"
+
+     - name: Assert that the correct set of commands were generated
+       assert:
+         that:
+-          - "{{ deleted['commands'] | symmetric_difference(result['comm=
ands']) |length =3D=3D 0 }}"
++          - "deleted['commands'] | symmetric_difference(result['command=
s']) |length =3D=3D 0"
+
+     - name: Assert that the after dicts were correctly generated
+       assert:
+         that:
+-          - "{{ deleted['after'] | symmetric_difference(result['after']=
) |length =3D=3D 0 }}"
++          - "deleted['after'] | symmetric_difference(result['after']) |=
length =3D=3D 0"
+
+     - name: Delete attributes of given interfaces (IDEMPOTENT)
+       vyos.vyos.vyos_lldp_interfaces: *deleted
+@@ -41,6 +41,6 @@
+     - name: Assert that the before dicts were correctly generated
+       assert:
+         that:
+-          - "{{ deleted['after'] | symmetric_difference(result['before'=
]) |length =3D=3D 0 }}"
++          - "deleted['after'] | symmetric_difference(result['before']) =
|length =3D=3D 0"
+   always:
+     - include_tasks: _remove_config.yaml
+diff --git a/test/integration/targets/incidental_vyos_lldp_interfaces/te=
sts/cli/merged.yaml b/test/integration/targets/incidental_vyos_lldp_inter=
faces/tests/cli/merged.yaml
+index bf968b21de..7e0bb53d33 100644
+--- a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli=
/merged.yaml
++++ b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli=
/merged.yaml
+@@ -28,17 +28,17 @@
+
+     - name: Assert that before dicts were correctly generated
+       assert:
+-        that: "{{ merged['before'] | symmetric_difference(result['befor=
e']) |length =3D=3D 0 }}"
++        that: "merged['before'] | symmetric_difference(result['before']=
) |length =3D=3D 0"
+
+     - name: Assert that correct set of commands were generated
+       assert:
+         that:
+-          - "{{ merged['commands'] | symmetric_difference(result['comma=
nds']) |length =3D=3D 0 }}"
++          - "merged['commands'] | symmetric_difference(result['commands=
']) |length =3D=3D 0"
+
+     - name: Assert that after dicts was correctly generated
+       assert:
+         that:
+-          - "{{ merged['after'] | symmetric_difference(result['after'])=
 |length =3D=3D 0 }}"
++          - "merged['after'] | symmetric_difference(result['after']) |l=
ength =3D=3D 0"
+
+     - name: Merge the provided configuration with the existing running =
configuration (IDEMPOTENT)
+       vyos.vyos.vyos_lldp_interfaces: *merged
+@@ -52,7 +52,7 @@
+     - name: Assert that before dicts were correctly generated
+       assert:
+         that:
+-          - "{{ merged['after'] | symmetric_difference(result['before']=
) |length =3D=3D 0 }}"
++          - "merged['after'] | symmetric_difference(result['before']) |=
length =3D=3D 0"
+
+   always:
+     - include_tasks: _remove_config.yaml
+diff --git a/test/integration/targets/incidental_vyos_lldp_interfaces/te=
sts/cli/overridden.yaml b/test/integration/targets/incidental_vyos_lldp_i=
nterfaces/tests/cli/overridden.yaml
+index 8cf038c91b..ad13f39328 100644
+--- a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli=
/overridden.yaml
++++ b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli=
/overridden.yaml
+@@ -19,17 +19,17 @@
+     - name: Assert that before dicts were correctly generated
+       assert:
+         that:
+-          - "{{ populate_intf | symmetric_difference(result['before']) =
|length =3D=3D 0 }}"
++          - "populate_intf | symmetric_difference(result['before']) |le=
ngth =3D=3D 0"
+
+     - name: Assert that correct commands were generated
+       assert:
+         that:
+-          - "{{ overridden['commands'] | symmetric_difference(result['c=
ommands']) |length =3D=3D 0 }}"
++          - "overridden['commands'] | symmetric_difference(result['comm=
ands']) |length =3D=3D 0"
+
+     - name: Assert that after dicts were correctly generated
+       assert:
+         that:
+-          - "{{ overridden['after'] | symmetric_difference(result['afte=
r']) |length =3D=3D 0 }}"
++          - "overridden['after'] | symmetric_difference(result['after']=
) |length =3D=3D 0"
+
+     - name: Overrides all device configuration with provided configurat=
ions (IDEMPOTENT)
+       vyos.vyos.vyos_lldp_interfaces: *overridden
+@@ -43,7 +43,7 @@
+     - name: Assert that before dicts were correctly generated
+       assert:
+         that:
+-          - "{{ overridden['after'] | symmetric_difference(result['befo=
re']) |length =3D=3D 0 }}"
++          - "overridden['after'] | symmetric_difference(result['before'=
]) |length =3D=3D 0"
+
+   always:
+     - include_tasks: _remove_config.yaml
+diff --git a/test/integration/targets/incidental_vyos_lldp_interfaces/te=
sts/cli/replaced.yaml b/test/integration/targets/incidental_vyos_lldp_int=
erfaces/tests/cli/replaced.yaml
+index 17acf0654c..aadc379300 100644
+--- a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli=
/replaced.yaml
++++ b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli=
/replaced.yaml
+@@ -33,17 +33,17 @@
+     - name: Assert that correct set of commands were generated
+       assert:
+         that:
+-          - "{{ replaced['commands'] | symmetric_difference(result['com=
mands']) |length =3D=3D 0 }}"
++          - "replaced['commands'] | symmetric_difference(result['comman=
ds']) |length =3D=3D 0"
+
+     - name: Assert that before dicts are correctly generated
+       assert:
+         that:
+-          - "{{ populate | symmetric_difference(result['before']) |leng=
th =3D=3D 0 }}"
++          - "populate | symmetric_difference(result['before']) |length =
=3D=3D 0"
+
+     - name: Assert that after dict is correctly generated
+       assert:
+         that:
+-          - "{{ replaced['after'] | symmetric_difference(result['after'=
]) |length =3D=3D 0 }}"
++          - "replaced['after'] | symmetric_difference(result['after']) =
|length =3D=3D 0"
+
+     - name: Replace device configurations of listed LLDP interfaces wit=
h provided configurarions (IDEMPOTENT)
+       vyos.vyos.vyos_lldp_interfaces: *replaced
+@@ -57,7 +57,7 @@
+     - name: Assert that before dict is correctly generated
+       assert:
+         that:
+-          - "{{ replaced['after'] | symmetric_difference(result['before=
']) |length =3D=3D 0 }}"
++          - "replaced['after'] | symmetric_difference(result['before'])=
 |length =3D=3D 0"
+
+   always:
+     - include_tasks: _remove_config.yaml
+diff --git a/test/integration/targets/include_vars/tasks/main.yml b/test=
/integration/targets/include_vars/tasks/main.yml
+index db15ba3c5d..6fc4e85a33 100644
+--- a/test/integration/targets/include_vars/tasks/main.yml
++++ b/test/integration/targets/include_vars/tasks/main.yml
+@@ -15,7 +15,7 @@
+     that:
+       - "testing =3D=3D 789"
+       - "base_dir =3D=3D 'environments/development'"
+-      - "{{ included_one_file.ansible_included_var_files=C2=A0| length =
}} =3D=3D 1"
++      - "included_one_file.ansible_included_var_files=C2=A0| length =3D=
=3D 1"
+       - "'vars/environments/development/all.yml' in included_one_file.a=
nsible_included_var_files[0]"
+
+ - name: include the vars/environments/development/all.yml and save resu=
lts in all
+@@ -51,7 +51,7 @@
+   assert:
+     that:
+       - webapp_version is defined
+-      - "'file_without_extension' in '{{ include_without_file_extension=
.ansible_included_var_files | join(' ') }}'"
++      - "'file_without_extension' in include_without_file_extension.ans=
ible_included_var_files | join(' ')"
+
+ - name: include every directory in vars
+   include_vars:
+@@ -67,7 +67,7 @@
+       - "testing =3D=3D 456"
+       - "base_dir =3D=3D 'services'"
+       - "webapp_containers =3D=3D 10"
+-      - "{{ include_every_dir.ansible_included_var_files=C2=A0| length =
}} =3D=3D 7"
++      - "include_every_dir.ansible_included_var_files=C2=A0| length =3D=
=3D 7"
+       - "'vars/all/all.yml' in include_every_dir.ansible_included_var_f=
iles[0]"
+       - "'vars/environments/development/all.yml' in include_every_dir.a=
nsible_included_var_files[1]"
+       - "'vars/environments/development/services/webapp.yml' in include=
_every_dir.ansible_included_var_files[2]"
+@@ -88,9 +88,9 @@
+     that:
+       - "testing =3D=3D 789"
+       - "base_dir =3D=3D 'environments/development'"
+-      - "{{ include_without_webapp.ansible_included_var_files=C2=A0| le=
ngth }} =3D=3D 4"
+-      - "'webapp.yml' not in '{{ include_without_webapp.ansible_include=
d_var_files | join(' ') }}'"
+-      - "'file_without_extension' not in '{{ include_without_webapp.ans=
ible_included_var_files | join(' ') }}'"
++      - "include_without_webapp.ansible_included_var_files=C2=A0| lengt=
h =3D=3D 4"
++      - "'webapp.yml' not in include_without_webapp.ansible_included_va=
r_files | join(' ')"
++      - "'file_without_extension' not in include_without_webapp.ansible=
_included_var_files | join(' ')"
+
+ - name: include only files matching webapp.yml
+   include_vars:
+@@ -104,9 +104,9 @@
+       - "testing =3D=3D 101112"
+       - "base_dir =3D=3D 'development/services'"
+       - "webapp_containers =3D=3D 20"
+-      - "{{ include_match_webapp.ansible_included_var_files=C2=A0| leng=
th }} =3D=3D 1"
++      - "include_match_webapp.ansible_included_var_files=C2=A0| length =
=3D=3D 1"
+       - "'vars/environments/development/services/webapp.yml' in include=
_match_webapp.ansible_included_var_files[0]"
+-      - "'all.yml' not in '{{ include_match_webapp.ansible_included_var=
_files | join(' ') }}'"
++      - "'all.yml' not in include_match_webapp.ansible_included_var_fil=
es | join(' ')"
+
+ - name: include only files matching webapp.yml and store results in web=
app
+   include_vars:
+@@ -173,10 +173,10 @@
+ - name: Verify the hash variable
+   assert:
+     that:
+-      - "{{ config | length }} =3D=3D 3"
++      - "config | length =3D=3D 3"
+       - "config.key0 =3D=3D 0"
+       - "config.key1 =3D=3D 0"
+-      - "{{ config.key2 | length }} =3D=3D 1"
++      - "config.key2 | length =3D=3D 1"
+       - "config.key2.a =3D=3D 21"
+
+ - name: Include the second file to merge the hash variable
+@@ -187,10 +187,10 @@
+ - name: Verify that the hash is merged
+   assert:
+     that:
+-      - "{{ config | length }} =3D=3D 4"
++      - "config | length =3D=3D 4"
+       - "config.key0 =3D=3D 0"
+       - "config.key1 =3D=3D 1"
+-      - "{{ config.key2 | length }} =3D=3D 2"
++      - "config.key2 | length =3D=3D 2"
+       - "config.key2.a =3D=3D 21"
+       - "config.key2.b =3D=3D 22"
+       - "config.key3 =3D=3D 3"
+@@ -202,9 +202,9 @@
+ - name: Verify that the properties from the first file is cleared
+   assert:
+     that:
+-      - "{{ config | length }} =3D=3D 3"
++      - "config | length =3D=3D 3"
+       - "config.key1 =3D=3D 1"
+-      - "{{ config.key2 | length }} =3D=3D 1"
++      - "config.key2 | length =3D=3D 1"
+       - "config.key2.b =3D=3D 22"
+       - "config.key3 =3D=3D 3"
+
+diff --git a/test/integration/targets/lookup_ini/test_lookup_properties.=
yml b/test/integration/targets/lookup_ini/test_lookup_properties.yml
+index a6fc0f7d7c..ed34760092 100644
+--- a/test/integration/targets/lookup_ini/test_lookup_properties.yml
++++ b/test/integration/targets/lookup_ini/test_lookup_properties.yml
+@@ -10,7 +10,7 @@
+         field_with_space: "{{lookup('ini', 'field.with.space  type=3Dpr=
operties  file=3Dlookup.properties')}}"
+
+     - assert:
+-        that: "{{item}} is defined"
++        that: "item is defined"
+       with_items: [ 'test1', 'test2', 'test_dot', 'field_with_space' ]
+
+     - name: "read ini value"
+diff --git a/test/integration/targets/lookup_subelements/tasks/main.yml =
b/test/integration/targets/lookup_subelements/tasks/main.yml
+index 9d93cf2096..7885347bb2 100644
+--- a/test/integration/targets/lookup_subelements/tasks/main.yml
++++ b/test/integration/targets/lookup_subelements/tasks/main.yml
+@@ -133,7 +133,7 @@
+
+ - assert:
+     that:
+-      - "'{{ item.0.name }}' !=3D 'carol'"
++      - "item.0.name !=3D 'carol'"
+   with_subelements:
+     - "{{ users }}"
+     - mysql.privs
+@@ -220,5 +220,5 @@
+
+ - assert:
+     that:
+-      - "'{{ user_alice }}' =3D=3D 'localhost'"
+-      - "'{{ user_bob }}' =3D=3D 'db1'"
++      - "user_alice =3D=3D 'localhost'"
++      - "user_bob =3D=3D 'db1'"
+diff --git a/test/integration/targets/loop_control/inner.yml b/test/inte=
gration/targets/loop_control/inner.yml
+index 1c286fa460..976f196102 100644
+--- a/test/integration/targets/loop_control/inner.yml
++++ b/test/integration/targets/loop_control/inner.yml
+@@ -3,7 +3,7 @@
+     that:
+       - ansible_loop.index =3D=3D ansible_loop.index0 + 1
+       - ansible_loop.revindex =3D=3D ansible_loop.revindex0 + 1
+-      - ansible_loop.first =3D=3D {{ ansible_loop.index =3D=3D 1 }}
+-      - ansible_loop.last =3D=3D {{ ansible_loop.index =3D=3D ansible_l=
oop.length }}
++      - ansible_loop.first =3D=3D (ansible_loop.index =3D=3D 1)
++      - ansible_loop.last =3D=3D (ansible_loop.index =3D=3D ansible_loo=
p.length)
+       - ansible_loop.length =3D=3D 3
+       - ansible_loop.allitems|join(',') =3D=3D 'first,second,third'
+diff --git a/test/integration/targets/module_precedence/modules_test_mul=
tiple_roles.yml b/test/integration/targets/module_precedence/modules_test=
_multiple_roles.yml
+index f4bd264957..182c2158e8 100644
+--- a/test/integration/targets/module_precedence/modules_test_multiple_r=
oles.yml
++++ b/test/integration/targets/module_precedence/modules_test_multiple_r=
oles.yml
+@@ -14,4 +14,4 @@
+   - assert:
+       that:
+         - '"location" in result'
+-        - 'result["location"] =3D=3D "{{ expected_location}}"'
++        - 'result["location"] =3D=3D expected_location'
+diff --git a/test/integration/targets/module_precedence/modules_test_mul=
tiple_roles_reverse_order.yml b/test/integration/targets/module_precedenc=
e/modules_test_multiple_roles_reverse_order.yml
+index 5403ae238c..ec5619f39e 100644
+--- a/test/integration/targets/module_precedence/modules_test_multiple_r=
oles_reverse_order.yml
++++ b/test/integration/targets/module_precedence/modules_test_multiple_r=
oles_reverse_order.yml
+@@ -13,4 +13,4 @@
+   - assert:
+       that:
+         - '"location" in result'
+-        - 'result["location"] =3D=3D "{{ expected_location}}"'
++        - 'result["location"] =3D=3D expected_location'
+diff --git a/test/integration/targets/module_precedence/multiple_roles/b=
ar/tasks/main.yml b/test/integration/targets/module_precedence/multiple_r=
oles/bar/tasks/main.yml
+index 52c3402013..62b38a7cb5 100644
+--- a/test/integration/targets/module_precedence/multiple_roles/bar/task=
s/main.yml
++++ b/test/integration/targets/module_precedence/multiple_roles/bar/task=
s/main.yml
+@@ -7,4 +7,4 @@
+   assert:
+     that:
+       - '"location" in result'
+-      - 'result["location"] =3D=3D "{{ expected_location }}"'
++      - 'result["location"] =3D=3D expected_location'
+diff --git a/test/integration/targets/module_precedence/multiple_roles/f=
oo/tasks/main.yml b/test/integration/targets/module_precedence/multiple_r=
oles/foo/tasks/main.yml
+index 52c3402013..62b38a7cb5 100644
+--- a/test/integration/targets/module_precedence/multiple_roles/foo/task=
s/main.yml
++++ b/test/integration/targets/module_precedence/multiple_roles/foo/task=
s/main.yml
+@@ -7,4 +7,4 @@
+   assert:
+     that:
+       - '"location" in result'
+-      - 'result["location"] =3D=3D "{{ expected_location }}"'
++      - 'result["location"] =3D=3D expected_location'
+diff --git a/test/integration/targets/script/tasks/main.yml b/test/integ=
ration/targets/script/tasks/main.yml
+index 989513d531..74189f817d 100644
+--- a/test/integration/targets/script/tasks/main.yml
++++ b/test/integration/targets/script/tasks/main.yml
+@@ -198,7 +198,7 @@
+   assert:
+     that:
+       - _check_mode_test2 is skipped
+-      - '_check_mode_test2.msg =3D=3D "{{ remote_tmp_dir_test | expandu=
ser }}/afile2.txt exists, matching creates option"'
++      - '_check_mode_test2.msg =3D=3D remote_tmp_dir_test | expanduser =
~ "/afile2.txt exists, matching creates option"'
+
+ - name: Remove afile2.txt
+   file:
+@@ -220,7 +220,7 @@
+   assert:
+     that:
+       - _check_mode_test3 is skipped
+-      - '_check_mode_test3.msg =3D=3D "{{ remote_tmp_dir_test | expandu=
ser }}/afile2.txt does not exist, matching removes option"'
++      - '_check_mode_test3.msg =3D=3D remote_tmp_dir_test | expanduser =
~ "/afile2.txt does not exist, matching removes option"'
+
+ # executable
+
+diff --git a/test/integration/targets/slurp/tasks/main.yml b/test/integr=
ation/targets/slurp/tasks/main.yml
+index 939859415a..f8ebb1594c 100644
+--- a/test/integration/targets/slurp/tasks/main.yml
++++ b/test/integration/targets/slurp/tasks/main.yml
+@@ -33,7 +33,7 @@
+       - 'slurp_existing.encoding =3D=3D "base64"'
+       - 'slurp_existing is not changed'
+       - 'slurp_existing is not failed'
+-      - '"{{ slurp_existing.content | b64decode }}" =3D=3D "We are at t=
he caf=C3=A9"'
++      - 'slurp_existing.content | b64decode =3D=3D "We are at the caf=C3=
=A9"'
+
+ - name: Create a binary file to test with
+   copy:
+diff --git a/test/integration/targets/template/tasks/main.yml b/test/int=
egration/targets/template/tasks/main.yml
+index c0d2e11a65..3c91734b09 100644
+--- a/test/integration/targets/template/tasks/main.yml
++++ b/test/integration/targets/template/tasks/main.yml
+@@ -357,7 +357,7 @@
+ - assert:
+     that:
+       - "\"foo t'e~m\\plated\" in unusual_results.stdout_lines"
+-      - "{{unusual_results.stdout_lines| length}} =3D=3D 1"
++      - "unusual_results.stdout_lines| length =3D=3D 1"
+
+ - name: check that the unusual filename can be checked for changes
+   template:
+diff --git a/test/integration/targets/unarchive/tasks/test_missing_binar=
ies.yml b/test/integration/targets/unarchive/tasks/test_missing_binaries.=
yml
+index 58d38f4f91..49f862b46f 100644
+--- a/test/integration/targets/unarchive/tasks/test_missing_binaries.yml
++++ b/test/integration/targets/unarchive/tasks/test_missing_binaries.yml
+@@ -66,7 +66,7 @@
+           - zip_success.changed
+           # Verify that file list is generated
+           - "'files' in zip_success"
+-          - "{{zip_success['files']| length}} =3D=3D 3"
++          - "zip_success['files']| length =3D=3D 3"
+           - "'foo-unarchive.txt' in zip_success['files']"
+           - "'foo-unarchive-777.txt' in zip_success['files']"
+           - "'FOO-UNAR.TXT' in zip_success['files']"
+diff --git a/test/integration/targets/unarchive/tasks/test_mode.yml b/te=
st/integration/targets/unarchive/tasks/test_mode.yml
+index c69e3bd2b2..06fbc7b8d9 100644
+--- a/test/integration/targets/unarchive/tasks/test_mode.yml
++++ b/test/integration/targets/unarchive/tasks/test_mode.yml
+@@ -24,7 +24,7 @@
+       - "unarchive06_stat.stat.mode =3D=3D '0600'"
+       # Verify that file list is generated
+       - "'files' in unarchive06"
+-      - "{{unarchive06['files']| length}} =3D=3D 1"
++      - "unarchive06['files']| length =3D=3D 1"
+       - "'foo-unarchive.txt' in unarchive06['files']"
+
+ - name: remove our tar.gz unarchive destination
+@@ -74,7 +74,7 @@
+       - "unarchive07.changed =3D=3D false"
+       # Verify that file list is generated
+       - "'files' in unarchive07"
+-      - "{{unarchive07['files']| length}} =3D=3D 1"
++      - "unarchive07['files']| length =3D=3D 1"
+       - "'foo-unarchive.txt' in unarchive07['files']"
+
+ - name: remove our tar.gz unarchive destination
+@@ -108,7 +108,7 @@
+       - "unarchive08_stat.stat.mode =3D=3D '0601'"
+       # Verify that file list is generated
+       - "'files' in unarchive08"
+-      - "{{unarchive08['files']| length}} =3D=3D 3"
++      - "unarchive08['files']| length =3D=3D 3"
+       - "'foo-unarchive.txt' in unarchive08['files']"
+       - "'foo-unarchive-777.txt' in unarchive08['files']"
+       - "'FOO-UNAR.TXT' in unarchive08['files']"
+@@ -140,7 +140,7 @@
+       - "unarchive08_stat.stat.mode =3D=3D '0601'"
+       # Verify that file list is generated
+       - "'files' in unarchive08"
+-      - "{{unarchive08['files']| length}} =3D=3D 3"
++      - "unarchive08['files']| length =3D=3D 3"
+       - "'foo-unarchive.txt' in unarchive08['files']"
+       - "'foo-unarchive-777.txt' in unarchive08['files']"
+       - "'FOO-UNAR.TXT' in unarchive08['files']"
+diff --git a/test/integration/targets/unarchive/tasks/test_unprivileged_=
user.yml b/test/integration/targets/unarchive/tasks/test_unprivileged_use=
r.yml
+index 8ee1db49e4..9f45e4c991 100644
+--- a/test/integration/targets/unarchive/tasks/test_unprivileged_user.ym=
l
++++ b/test/integration/targets/unarchive/tasks/test_unprivileged_user.ym=
l
+@@ -40,7 +40,7 @@
+           - unarchive10 is changed
+           # Verify that file list is generated
+           - "'files' in unarchive10"
+-          - "{{unarchive10['files']| length}} =3D=3D 1"
++          - "unarchive10['files']| length =3D=3D 1"
+           - "'foo-unarchive.txt' in unarchive10['files']"
+           - archive_path.stat.exists
+
+diff --git a/test/integration/targets/unarchive/tasks/test_zip.yml b/tes=
t/integration/targets/unarchive/tasks/test_zip.yml
+index cf03946fcd..0fc5dc9ce6 100644
+--- a/test/integration/targets/unarchive/tasks/test_zip.yml
++++ b/test/integration/targets/unarchive/tasks/test_zip.yml
+@@ -17,7 +17,7 @@
+       - "unarchive03.changed =3D=3D true"
+       # Verify that file list is generated
+       - "'files' in unarchive03"
+-      - "{{unarchive03['files']| length}} =3D=3D 3"
++      - "unarchive03['files']| length =3D=3D 3"
+       - "'foo-unarchive.txt' in unarchive03['files']"
+       - "'foo-unarchive-777.txt' in unarchive03['files']"
+       - "'FOO-UNAR.TXT' in unarchive03['files']"
+diff --git a/test/integration/targets/wait_for/tasks/main.yml b/test/int=
egration/targets/wait_for/tasks/main.yml
+index f71ddbda6b..f81fd0f246 100644
+--- a/test/integration/targets/wait_for/tasks/main.yml
++++ b/test/integration/targets/wait_for/tasks/main.yml
+@@ -40,7 +40,7 @@
+   assert:
+     that:
+       - waitfor is successful
+-      - waitfor.path =3D=3D "{{ remote_tmp_dir | expanduser }}/wait_for=
_file"
++      - waitfor.path =3D=3D remote_tmp_dir | expanduser ~ "/wait_for_fi=
le"
+       - waitfor.elapsed >=3D 2
+       - waitfor.elapsed <=3D 15
+
+@@ -58,7 +58,7 @@
+   assert:
+     that:
+       - waitfor is successful
+-      - waitfor.path =3D=3D "{{ remote_tmp_dir | expanduser }}/wait_for=
_file"
++      - waitfor.path =3D=3D remote_tmp_dir | expanduser ~ "/wait_for_fi=
le"
+       - waitfor.elapsed >=3D 2
+       - waitfor.elapsed <=3D 15
+
+@@ -156,7 +156,7 @@
+     that:
+       - waitfor is successful
+       - waitfor is not changed
+-      - "waitfor.port =3D=3D {{ http_port }}"
++      - "waitfor.port =3D=3D http_port"
+
+ - name: install psutil using pip (non-Linux only)
+   pip:
+@@ -184,7 +184,7 @@
+     that:
+       - waitfor is successful
+       - waitfor is not changed
+-      - "waitfor.port =3D=3D {{ http_port }}"
++      - "waitfor.port =3D=3D http_port"
+
+ - name: test wait_for with delay
+   wait_for:
+diff --git a/test/units/parsing/yaml/test_dumper.py b/test/units/parsing=
/yaml/test_dumper.py
+index 5fbc139ba0..cbf5b45646 100644
+--- a/test/units/parsing/yaml/test_dumper.py
++++ b/test/units/parsing/yaml/test_dumper.py
+@@ -29,7 +29,6 @@ from ansible.parsing.yaml import dumper, objects
+ from ansible.parsing.yaml.loader import AnsibleLoader
+ from ansible.module_utils.six import PY2
+ from ansible.template import AnsibleUndefined
+-from ansible.utils.unsafe_proxy import AnsibleUnsafeText, AnsibleUnsafe=
Bytes
+
+ from units.mock.yaml_helper import YamlTestUtils
+ from units.mock.vault_helper import TextVaultSecret
+@@ -69,8 +68,7 @@ class TestAnsibleDumper(unittest.TestCase, YamlTestUti=
ls):
+
+     def test_bytes(self):
+         b_text =3D u'tr=C3=A9ma'.encode('utf-8')
+-        unsafe_object =3D AnsibleUnsafeBytes(b_text)
+-        yaml_out =3D self._dump_string(unsafe_object, dumper=3Dself.dum=
per)
++        yaml_out =3D self._dump_string(b_text, dumper=3Dself.dumper)
+
+         stream =3D self._build_stream(yaml_out)
+         loader =3D self._loader(stream)
+@@ -97,8 +95,7 @@ class TestAnsibleDumper(unittest.TestCase, YamlTestUti=
ls):
+
+     def test_unicode(self):
+         u_text =3D u'n=C3=B6el'
+-        unsafe_object =3D AnsibleUnsafeText(u_text)
+-        yaml_out =3D self._dump_string(unsafe_object, dumper=3Dself.dum=
per)
++        yaml_out =3D self._dump_string(u_text, dumper=3Dself.dumper)
+
+         stream =3D self._build_stream(yaml_out)
+         loader =3D self._loader(stream)
+--
+2.40.0
diff --git a/recipes-devtools/python/python3-ansible_2.14.11.bb b/recipes=
-devtools/python/python3-ansible_2.14.11.bb
index f3ab2377..f57ef6f8 100644
--- a/recipes-devtools/python/python3-ansible_2.14.11.bb
+++ b/recipes-devtools/python/python3-ansible_2.14.11.bb
@@ -9,4 +9,5 @@ RDEPENDS:${PN} +=3D "python3-pyyaml \
=20
 SRC_URI +=3D " \
     file://python3-ensure-py-scripts-use-py3-for-shebang.patch \
+    file://CVE-2023-5764.patch \
 "
--=20
2.40.0


