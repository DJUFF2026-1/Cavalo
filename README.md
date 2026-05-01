---

# Galope Investigativo

Projeto desenvolvido na **Godot Engine**, com foco em mecânicas de exploração, interação e eventos dinâmicos.

---

## Como rodar o projeto

### 1. Clonar o repositório

```bash
git clone https://github.com/DJUFF2026-1/Cavalo.git
```

### 2. Importar no Godot

* Abra o **Godot Engine**
* Clique em **Import**
* Selecione a pasta do projeto
* Clique em **Import & Edit**

---

## Configuração do Projeto (IMPORTANTE)

Para que o projeto funcione corretamente, é necessário configurar manualmente os **inputs** no Godot.

### Caminho:

```
Project → Project Settings → Input Map
```

### Ações que devem ser criadas

Adicione exatamente as seguintes ações:

| Ação                           | Entrada configurada        |
| ------------------------------ | -------------------------- |
| `ui_free_camera`               | Tecla `Tab`                |
| `ui_zoom_camera_world_bigger`  | Scroll do mouse para cima  |
| `ui_zoom_camera_world_smaller` | Scroll do mouse para baixo |
| `ui_left_mouse_click`          | Botão esquerdo do mouse    |

> Caso essas configurações não sejam feitas, o projeto **não reconhecerá corretamente os controles**.

---

## Estrutura do projeto

```bash
res://
├── assets/
│   └── png/
│       ├── cavalplaceh.png
│       ├── interestPlaceholder.png
│       ├── placeholdertile.png
│       └── placeholderWALLtile.png
│
├── scenes/
│   ├── scene_obj/
│   │   ├── interestClickable.tscn
│   │   └── player.tscn
│   │
│   ├── popup_menu_roleta.tscn
│   ├── roleta.tscn
│   ├── testMap.tscn
│   └── main_test_scene.tscn
│
├── scripts/
│   ├── globals.gd
│   ├── interestClickable.gd
│   ├── player.gd
│   └── tileMapLayer.gd
│
├── popup_interac_menu.gd
├── roleta.gd
├── mainbasic.gd
└── icon.svg
```

---

## Organização

* **assets/** → Recursos visuais (sprites, tiles, imagens)
* **scenes/** → Cenas principais do jogo
* **scene_obj/** → Objetos reutilizáveis (player, interações)
* **scripts/** → Scripts principais em GDScript
* Scripts fora da pasta `/scripts` → scripts específicos de cena/UI

---

## Controles

* `Tab` → Alternar modo de câmera livre
* `Scroll ↑` → Zoom in
* `Scroll ↓` → Zoom out
* `Clique esquerdo` → Interação

---

## Tecnologias utilizadas

* **Godot Engine**
* **GDScript**

---

## Observações

* Utilize uma versão compatível da **Godot** (recomendado Godot 4.x)
* Sempre verifique se os **inputs estão configurados corretamente**
* Estrutura do projeto pode evoluir conforme novas features

---
