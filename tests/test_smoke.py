"""Smoke test: pipeline YAML -> CSD genera N file non vuoti."""
import os
import subprocess
import shutil


def test_pipeline_generates_csd(tmp_path):
    repo_root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    out_dir = os.path.join(repo_root, "csound", "generazione")

    if os.path.isdir(out_dir):
        shutil.rmtree(out_dir)

    subprocess.run(
        ["make", "py", "YAML=brano", "SEZIONE=sezione1"],
        cwd=repo_root,
        check=True,
        capture_output=True,
    )

    csd_files = [f for f in os.listdir(out_dir) if f.endswith(".csd")]
    assert len(csd_files) == 6, f"Atteso 6 file CSD, trovati {len(csd_files)}"

    for f in csd_files:
        path = os.path.join(out_dir, f)
        assert os.path.getsize(path) > 0, f"CSD vuoto: {f}"


def test_deprecated_alias_warns():
    import warnings
    import yaml
    from delta.builder import Brano

    repo_root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    with open(os.path.join(repo_root, "compositions", "brano.yaml")) as f:
        dizionario = yaml.safe_load(f)

    sezione_path = os.path.join(repo_root, "compositions", "sezioni", "sezione1.yaml")
    with open(sezione_path) as f:
        dizionario["brano"]["sezioni"] = {"sezione1": yaml.safe_load(f)}

    os.chdir(repo_root)
    brano = Brano(dizionario["brano"])

    with warnings.catch_warnings(record=True) as w:
        warnings.simplefilter("always")
        brano.scriviCsd()
        assert any(issubclass(x.category, DeprecationWarning) for x in w), "scriviCsd dovrebbe emettere DeprecationWarning"
